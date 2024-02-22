<?php
class mysqlx
{
  public function __construct(string $host, string $username, string $password, string $dbname)
  {
    $this->host = $host;
    $this->username = $username;
    $this->password = $password;
    $this->dbname = $dbname;
  }

  function open()
  {
    $this->connection = new mysqli($this->host, $this->username, $this->password, $this->dbname);
    $this->connection->set_charset('utf8');
    return $this->connection;
  }

  function query(string $sql)
  {
    if ($this->connection) {
      return $this->connection->query($sql);
    }
  }

  function close()
  {
    if ($this->connection) {
      $res = $this->connection->close();
      $this->connection = null;
      return $res;
    }
  }
}

require './mysql.info.php';
$db = new mysqlx(
  $mysql_connection_info['host'],
  $mysql_connection_info['username'],
  $mysql_connection_info['password'],
  $mysql_connection_info['dbname']
);
