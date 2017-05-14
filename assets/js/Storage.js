/**
 *
 */

.pragma library
.import QtQuick.LocalStorage 2.0 as Sql

    var LocalStorage = Sql.LocalStorage
    var db = null;

    function transaction(cb) {
        db.transaction(cb);
    }

    function builder(table, cb) {
        db.transaction(function(tx) {
            cb(new Builder(table, tx))
        })
    }

    function load(databaseName, version) {
        db = LocalStorage.openDatabaseSync(databaseName, version, databaseName + "local storage", 1000000);
    }

    function Builder(table, tx) {
        this.table = table
        this.params = {}
        this.tx = tx
    }

    Builder.prototype = {
        add: function(obj, key) {
            if(key) {
                this.params[key] = obj[key];
            } else {
                for(var i in obj) {
                    if(obj.hasOwnProperty(i)) {
                        this.params[i] = obj[i]
                    }
                }
            }
        },

        select: function(key) {
            return this.tx.executeSql("SELECT * FROM %1 WHERE %2=?".arg(this.table).arg(key[0]), [key[1]]).rows;
        },

        delete: function (key) {
            this.tx.executeSql("DELETE FROM %1 WHERE %2=?".arg(this.table).arg(key[0]), [key[1]]);
        },

        insert: function(obj) {
            if(obj) {
                this.add(obj);
            }

            var fields = Object.keys(this.params);

            if(fields.length > 0) {
                var query = fields.join(", "),
                    values = fields.map(function() { return "?"; }).join(", ")

                this.tx.executeSql("INSERT INTO %1 (%2) VALUES (%3)".arg(this.table).arg(query).arg(values), this.params)
            }
        },

        update: function(where, obj) {
            if(obj) {
                this.add(obj);
            }

            var fields = Object.keys(this.params)

            if(fields.length > 0) {
                var query = fields.join("=?, "),
                    values = fields.map(function(e) { return this.params[e] })

                this.tx.executeSql("UPDATE %1 SET %2=? WHERE %3=?".arg(this.table).arg(query).arg(where[0]), values.concat(where[1]))
            }
        },

        clear: function() {
            this.params = [];
        }
    };

    /**
     *	obj - object that contains value to find
     */
    function find(obj, table, primary_key) {
        var result = null;

        db.transaction(function(tx) {
            var builder = new Builder(table, tx);

            var rows = builder.select([primary_key, obj[primary_key]]);
            if(rows.length > 0) {
                result = rows.item(0);
            }
        });

        return result;
    }

    /**
     *	obj - key or new object
     *  where - what we save or where we save obj to
     */
    function save(obj, where, table, primary_key) {
        db.transaction(function(tx) {
            var builder = new Builder(table, tx);

            if(obj === undefined) {
                for(var field in where) {
                    if(where.hasOwnProperty(field)) {
                        builder.add(where, field);
                    }
                }
            } else if (typeof obj == "string") {
                if(where.hasOwnProperty(obj)) {
                    builder.add(where, obj);
                }
            } else if(typeof obj == "object") {
                for(var key in obj) {
                    if(obj.hasOwnProperty(key)) {
                        where[key] = obj[key];
                        builder.add(obj, key);
                    }
                }
            }

            builder.update([primary_key, where[primary_key]]);
        });
    }

    /**
     *	obj - new object
     */
    function create(obj, table, primary_key) {
        var result = null;

        db.transaction(function(tx) {
            var builder = new Builder(table, tx);

            for(var key in obj) {
                if(obj.hasOwnProperty(key)) {
                    builder.add(obj, key);
                    //console.debug(key);
                }
            }

            var check = builder.select([primary_key, obj[primary_key]]);

            if(check.length > 0) {
                builder.delete([primary_key, obj[primary_key]])
            }

            builder.insert(tx);

            var rows = builder.select([primary_key, obj[primary_key]]);

            if(rows.length > 0) {
                result = rows.item(0);
            }
        });

        return result;
    }

    /**
     *	obj - object to remove
     */
    function remove(obj, table, primary_key) {
        db.transaction(function(tx) {
            var builder = new Builder(table, tx);
            builder.delete([primary_key, obj[primary_key]])
        });
    }

