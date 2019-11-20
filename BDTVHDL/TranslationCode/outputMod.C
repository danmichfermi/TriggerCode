#include <vector>
#include <fstream>
#include <algorithm>
outputMod()
{
  gROOT -> Reset();
  
  //File Initilizations//
  string inFileName = "outputfile100.txt";//Outputfile needing to be modified
  string outFileName = inFileName.substr(0, inFileName.size() - 4) + "mod.txt";//New outputfile
  ifstream inFile;
  ofstream outFile;
  inFile.open(inFileName.c_str());
  outFile.open(outFileName.c_str());
  
  string strReader;
  
  vector <string> dataHolder, nullHolder1, nullHolder2, nullHolder3;
  
  //While loop that runs through each line of the program replacing null oVars
  //with 0 in oVars of a higher level and then deleting any null oVars.
  //Note: no null oVar3s exist in the current way that the program
  //runs. For this to happen there would have to be a large number of null
  //oVar1s in a row, which is nigh impossible.  
  while(getline(inFile, strReader))
  {
    dataHolder.push_back(strReader);
    string temp1, temp2;
    //This removes null oVar1's and adds their name to the nullHolder1
    if (strReader.substr(0, 10) == "bool oVar1")
    {
      temp1 = strReader.substr(5, strReader.find(" = ") - 5);
      temp2 = strReader.substr(strReader.find(" = ") + 3, strReader.length()); 
      
      if (temp2.substr(0, 1) == "0")
      {
        nullHolder1.push_back(temp1);
        dataHolder.pop_back();
      }
      temp1.clear();
      temp2.clear();
    }  
    
    //This removes null oVar2's and adds their name to the nullHolder2
    if (strReader.substr(0, 10) == "bool oVar2")
    {
      temp1 = strReader.substr(5, strReader.find(" = ") - 5);
      temp2 = strReader.substr(strReader.find(" = ") + 3, strReader.length()); 
      
      if (temp2.substr(0, 1) == "0")//Looking for 0||0||0||0;
      {
        nullHolder2.push_back(temp1);
        dataHolder.pop_back();
      }
      
      if (temp2.substr(0, 1) == "o")//Looking for oVar2S###...
      {
        dataHolder.pop_back();
        string tempStr0, tempStr1, tempStr2, tempStr3; 
        tempStr0 = strReader;
        
        //This looks for the oVar in the first three places
        for (int i = 0; i < nullHolder1.size(); i++)
        {
          tempStr1.clear();
          string loopStr = nullHolder1[i] + "||";
          int tempInt1 = tempStr0.find(loopStr);

          if (tempInt1 > 0)//Found the oVar
          {
            tempStr1 = tempStr0.substr(0, tempInt1);
            tempStr2 = tempStr0.substr(
                                      tempInt1 + loopStr.length(), 
                                      tempStr0.length()
                                      );
            tempStr3 = tempStr1 + "0||" + tempStr2;
            tempStr0 = tempStr3;
            tempStr1.clear(); 
          }
        }
        
        //This looks for the oVar in the last place
        for (int i = 0; i < nullHolder1.size(); i++)
        {
          tempStr1.clear();
          string loopStr = nullHolder1[i] + ";";
          int tempInt1 = tempStr0.find(loopStr);
          if (tempInt1 > 0)
          {
            tempStr1 = tempStr0.substr(0, tempInt1);
            tempStr2 = tempStr0.substr(
                                      tempInt1 + loopStr.length(), 
                                      tempStr0.length()
                                      );
            tempStr3 = tempStr1 + "||0;" + tempStr2;
            tempStr0 = tempStr3; 
          }
        }
        temp1.clear();
        temp2.clear();
        dataHolder.push_back(tempStr0);
      } 
    }
    
    //This structure is identical to the oVar2 routine above except for working
    //on oVar3's.
    if (strReader.substr(0, 10) == "bool oVar3")
    {
      temp1 = strReader.substr(5, strReader.find(" = ") - 5);
      temp2 = strReader.substr(strReader.find(" = ") + 3, strReader.length()); 
      
      if (temp2.substr(0, 1) == "0")
      {
        nullHolder2.push_back(temp1);
        dataHolder.pop_back();
      }
      
      if (temp2.substr(0, 1) == "o")
      {
        dataHolder.pop_back();
        string tempStr0, tempStr1, tempStr2, tempStr3; 
        tempStr0 = strReader;
        
        for (int i = 0; i < nullHolder2.size(); i++)
        {
          tempStr1.clear();
          string loopStr = nullHolder2[i] + "||";
          int tempInt1 = tempStr0.find(loopStr);

          if (tempInt1 > 0)
          {
            tempStr1 = tempStr0.substr(0, tempInt1);
            tempStr2 = tempStr0.substr(
                                      tempInt1 + loopStr.length(), 
                                      tempStr0.length()
                                      );
            tempStr3 = tempStr1 + "0||" + tempStr2;
            tempStr0 = tempStr3;
            tempStr1.clear(); 
          }
        }
        
        for (int i = 0; i < nullHolder2.size(); i++)
        {
          tempStr1.clear();
          string loopStr = nullHolder2[i] + ";";
          int tempInt1 = tempStr0.find(loopStr);
          if (tempInt1 > 0)
          {
            tempStr1 = tempStr0.substr(0, tempInt1);
            tempStr2 = tempStr0.substr(
                                      tempInt1 + loopStr.length(), 
                                      tempStr0.length()
                                      );
            tempStr3 = tempStr1 + "||0;" + tempStr2;
            tempStr0 = tempStr3; 
          }
        }
        temp1.clear();
        temp2.clear();
        dataHolder.push_back(tempStr0);
      } 
    }        
  }
  
  if (inFile.bad()){cout << "IO error" << endl;}
  else if (!inFile.eof()){cout << "Format error" << endl;}
  else{cout << "Format error or End of file" << endl;}
  inFile.clear();
   
  for (int i = 0; i < dataHolder.size(); i++)
  {
    
    outFile << dataHolder[i] << endl;
  }
  
  inFile.close();
  outFile.close();
  
  
  
}
