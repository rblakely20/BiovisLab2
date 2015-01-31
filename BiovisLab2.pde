//create two tables to store the input and output data
Table inTable;
Table outTable;

void setup(){
  //load the input into inTable
  inTable = loadTable("zoo.csv");
  
  //create the columns of outTable
  outTable = new Table();
  outTable.addColumn("name");
  outTable.addColumn("hair");
  outTable.addColumn("feathers");
  outTable.addColumn("eggs");
  outTable.addColumn("milk");
  outTable.addColumn("airborne");
  outTable.addColumn("aquatic");
  outTable.addColumn("predator");
  outTable.addColumn("toothed");
  outTable.addColumn("backbone");
  outTable.addColumn("breathes");
  outTable.addColumn("venomous");
  outTable.addColumn("fins");
  outTable.addColumn("legs");
  outTable.addColumn("tail");
  outTable.addColumn("domestic");
  outTable.addColumn("catsize");
  outTable.addColumn("type");
  
  //go through inTable and outTable and transfer values
  for(int i = 0; i < 101; i++){//i is the row number
    //for each row, create a new row in outTable
    TableRow newRow = outTable.addRow();
    
    //transfer each item in the row
    for(int j = 0; j < 18; j++){//j is the column number
      if(j == 0){
        //transfer the name
        String name = inTable.getString(i, j);
        outTable.setString(i, "name", name);
      }
      
      else if(j == 13){
        //transfer the number
        int legs = inTable.getInt(i, j);
        outTable.setInt(i, "legs", legs);
      }
      
      else if(j == 17){
        //transfer the number
        int type = inTable.getInt(i, j);
        outTable.setInt(i, "type", type);
      }
      
      else{
        //convert number to boolean then transfer
        int tmp = inTable.getInt(i, j);
        if(tmp == 0){
          outTable.setString(i, j, "false");
        }
        else if(tmp == 1){
          outTable.setString(i, j, "true");
        }
      }
    }
  }
  //save the new table as zoo_out.csv
  saveTable(outTable, "zoo_out.csv");
}
