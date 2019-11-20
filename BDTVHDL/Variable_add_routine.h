//Factory Variable Addition Routine//
  //This routine goes through every branch of the tree, skips over any duplicate
  //branches, and only adds variables(branches) that have RMS values above zero.
  //The RMS is calculated for all of the entries with RMS = 0 are added to the 
  //constantVariables vector.
  
  TString branchName;//TString to become branch names
  vector <TString> branchNameVec;//Vector used to hold branch names
  vector <TString>::iterator findBranch;//Iterator to find duplicate branches
  vector <TString> constVariables;//Vector to hold variables that are constant
  vector <TString> bNameS, bNameB, bNameVec;
  TString bSList, bBList, bVList;
  
  for (int i = 0; i < signal -> GetListOfBranches() -> GetEntries(); i++)
  {
    branchName = signal -> GetListOfBranches() -> At(i) -> GetName();
    bNameS.push_back(branchName);
    bSList += branchName;
    bSList += ":";
  }
  
  for (int i = 0; i < background -> GetListOfBranches() -> GetEntries(); i++)
  {
    branchName = background -> GetListOfBranches() -> At(i) -> GetName();
    bNameB.push_back(branchName);
    bBList += branchName;
    bBList += ":";
  }
  
  for (int i = 0; i < bNameB.size(); i++)
  {
    if (bSList.Contains(bNameB[i]))
    {
      bNameVec.push_back(bNameB[i]);
      bVList += bNameB[i];
      bVList += ":";
    }
  }
  
  for (int i = 0; i < bNameS.size(); i++)
  {
    if (bBList.Contains(bNameS[i]) && !bVList.Contains(bNameS[i]))
    {
      bNameVec.push_back(bNameS[i]);
    }
  }
  bNameB.clear();
  bNameS.clear();
  bBList = "";
  bSList = "";
  bVList = "";
  branchNum = bNameVec.size();  
  
  for (int i = 0; i < branchNum; i++)//-1 for just files with sigweight
  {
    branchName = bNameVec[i];
    TString type = signal -> GetLeaf(branchName) -> GetTypeName();
    
    bool duplicateBranch = false;
    
    //This runs through the current listing of branch names and yields true
    //if the branch is a duplicate.
    findBranch = find(branchNameVec.begin(), branchNameVec.end(), branchName);
    if (findBranch != branchNameVec.end()) 
    {
      duplicateBranch = true;
    }
     
    else
    {
      branchNameVec.push_back(branchName);
    }
    
    
    //This routine generates a temporary histogram from all of the entries
    //of the branch and then calculates the RMS of the data.
    float signalRMS;//Float to become signal RMS
    float backgroundRMS;//Float to become background RMS
    bool boolRMS = false;//Bool used to record if branch is constant or not.
    
    signal -> Draw(branchName);//Draws histogram
    TH1F *tempHistSignal = (TH1F*)gPad -> GetPrimitive("htemp"); 
    signalRMS = tempHistSignal -> GetRMS();
    //gPad -> Close();
    
    background -> Draw(branchName);//Draws histogram
    TH1F *tempHistBackground = (TH1F*)gPad -> GetPrimitive("htemp"); 
    backgroundRMS = tempHistBackground -> GetRMS();
    //gPad -> Close();
    
    float rMin = 0.0;
    
    if (signalRMS > rMin || backgroundRMS > rMin)
    {
      boolRMS = false;
    }
    
    if (signalRMS == rMin && backgroundRMS == rMin)
    {
      boolRMS = true;
      constVariables.push_back(branchName);
    }
    
    if (
       duplicateBranch == false &&
       boolRMS == false &&
       //!spectatorCheck(branchName)
       !branchName.EqualTo("sigweight") &&
       !branchName.EqualTo("mass") &&
       !branchName.EqualTo("eventID") 
       )
    {
      if (type.Contains("i") || type.Contains("I")) {factory -> AddVariable(branchName, 'I');}
      if (type.Contains("f") || type.Contains("F")) {factory -> AddVariable(branchName, 'F');}
      //This can be F, I, or D
    }
    
    if (branchName.EqualTo("sigweight") || branchName.EqualTo("mass"))//(spectatorCheck(branchName))
    {
      factory -> AddSpectator(branchName);   
    }
    
  }
