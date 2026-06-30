<?php

class Taluka{
  public $Id;
  public $Name;

    /**
     * Get the value of Id
     *
     * @return mixed
     */
    public function getId()
    {
        return $this->Id;
    }

    /**
     * Set the value of Id
     *
     * @param mixed $Id
     *
     * @return self
     */
    public function setId($Id)
    {
        $this->Id = $Id;

        return $this;
    }

    /**
     * Get the value of name
     *
     * @return mixed
     */
    public function getName()
    {
        return $this->Name;
    }

    /**
     * Set the value of name
     *
     * @param mixed $name
     *
     * @return self
     */
    public function setName($name)
    {
        $this->Name = $name;

        return $this;
    }


    function insert(Taluka $Taluka){

        return "INSERT INTO Taluka(id,name) VALUES ('".$Taluka->getId()."','".$Taluka->getName()."')";

    }
	
	function check(Taluka $Taluka){
        return "SELECT * FROM Taluka WHERE name='".$Taluka->getName()."'";

    }

    function delete(Taluka $Taluka){

        return "DELETE FROM Taluka WHERE id='".$Taluka->getId()."'";

    }
	 function logname(Taluka $Taluka){

        return "SELECT name FROM Taluka WHERE id='".$Taluka->getId()."'";

    }

    function update(Taluka $Taluka){
      return  "UPDATE Taluka SET name='".$Taluka->getName()."' WHERE id = '".$Taluka->getId()."'";

    }

}

 ?>
