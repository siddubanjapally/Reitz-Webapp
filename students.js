/*var students = [
    {StudentId: '54D57044-A4B2-4B68-98D6-3C1AADF9ED3D', FirstName: 'Javascript', LatsName: 'BrendenEich', JoinDate: '2010-02-22'},
    {StudentId: '64E57044-B4B2-4B68-98D6-3C1VADF9ED3C', FirstName: 'Nodejs', LatsName: 'RyanDhal', JoinDate: '2014-03-01'}
];*/
/*var serverData = function(cb){
    var Connection = require('tedious').Connection;
    var Request = require('tedious').Request;
    var config = {
        "userName": "sa",
        "password": "Design_20",
        "server": "202.153.45.8",
        "options": {
            "database": "Test1",
            "instanceName": 'TECHNOID',
            "encrypt": true,
            "rowCollectionOnDone": false,
            "rowCollectionOnRequestCompletion": true
        }
    };
    var connection = new Connection(config);
    connection.on('connect', function(err){
        if(err){
            console.log('error');
            console.log(err);
        }else
        {
            console.log('success');
            var request = new Request("SELECT * FROM Students", function(err, rowCount, rows){
                console.log(rowCount);
                var array = [];
                rows.forEach(function(row){
                    console.log(row);
                    array.push(row);
                });
                cb(array);
                //console.log(JSON.stringify(rows));
                //cb(rows);
                //res.send(rows);
            });
            connection.execSql(request);
        }
    });
}*/
var sql = require('mssql');
var config = {
    user: 'sa',
    password: 'Design_20',
    server: '192.168.0.11',
    database: 'ReitzFanAnalytix',
    options: {
        "instanceName": 'TECHNOID'
    }
}


//posting data to server
var postData = function(cb){
    console.log(cb);
    sql.connect(config, function(err) {
        if(err){
            console.log('error');
        }else{
            console.log('success');
            console.log(cb.FirstName);
            console.log(cb.LatsName);
            console.log(cb.JoinDate);
            var request = new sql.Request();
            request.query("INSERT INTO Students(StudentId, FirstName, LatsName, JoinDate) VALUES ('"+cb.StudentId+"', '"+cb.FirstName+"', '"+cb.LatsName+"','"+cb.JoinDate+"')", function(err, success) {
                if(!err){
                    console.log('successfully inserted');
                }else{
                    console.log('please check your query');
                    console.log(err);
                }
            });
        }
    });
}

//retrieving data from server
var serverData = function(cb){
    sql.connect(config, function(err) {
        if(err){
            console.log('error');
        }else{
            console.log('success');
            var request = new sql.Request();
            request.query('select * from Students', function(err, recordset) {
                console.dir(recordset);
                cb(recordset);
            });
        }
    });
}

exports.list = function(req, res){
    serverData(function(students){
        //console.log(students);
        res.render('students', {title: 'Students List', users: students});
    });
};

exports.addStudent = function(req, res){
    res.render('addStudent', {title: 'Adding student details'});
};

exports.postData = function(req, res){
    postData(req.body);
    //res.render('success', {data: req.body});
}

