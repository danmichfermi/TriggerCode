void testtop() {
 TFile* data = new TFile("54.root"); 
  TTree* datatree = (TTree*)(data->Get("roadset"));
  TFile *target = new TFile("toproad.root","RECREATE" );
  TTree *tree = new TTree("toptree","treelibrated tree");

  Float_t BDT_response;
  tree->Branch("BDT_response",&BDT_response);
   TMVA::Tools::Instance();
  TMVA::Reader *reader = new TMVA::Reader( "V:Color:!Silent" );
	int lol= 2*(23+16+16+16+16);
	const int n= lol;
	float var[n];
	float dvar[n];
	int entry=0;
for(int i=1; i<24 ; i++){
		char* tname[10];
		char* tname2[10];
		char* bname[10];
		char* bname2[10];
		TString arg1; 		TString arg2; 		TString arg3; 		TString arg4; 
		sprintf(tname,"h1t%i",i);
		sprintf(tname2,"h1t%i/F",i);
		sprintf(bname,"h1b%i",i);
		sprintf(bname2,"h1b%i/F",i);
		arg1.Form(tname);			arg2.Form(tname2);			arg3.Form(bname);			arg4.Form(bname2);
//		cout<<entry<<endl;
		entry++;
//	cout<<arg1<<endl;
//		cout<<entry<<endl;
		entry++;
//	cout<<arg3<<endl;
//		t3->Branch(arg1 ,&hf1t[i],arg2);
//		tree->Branch(arg3 ,&dvar[24-1+i],arg4);
		reader->AddVariable(arg1,&var[i-1]);
		tree->Branch(arg1 ,&dvar[i-1], arg2);
		datatree->SetBranchAddress(arg1, &dvar[i-1]);
//		reader->AddVariable(arg3,&var[24-1+i]);
		
//	datatree->SetBranchAddress(arg3, &dvar[24-1+i]);
}
for(int i=1; i<17 ; i++){
		char* tname[10];
		char* tname2[10];
		char* bname[10];
		char* bname2[10];
		TString arg1; 		TString arg2; 		TString arg3; 		TString arg4; 
		sprintf(tname,"h2t%i",i);
		sprintf(tname2,"h2t%i/F",i);
		sprintf(bname,"h2b%i",i);
		sprintf(bname2,"h2b%i/F",i);
		arg1.Form(tname);			arg2.Form(tname2);			arg3.Form(bname);			arg4.Form(bname2);
		tree->Branch(arg1 ,&dvar[24+24-1+i], arg2);
//		tree->Branch(arg3 ,&dvar[24+24+17-1+i],arg4);
	reader->AddVariable(arg1,&var[24+24-1+i]);
//	reader->AddVariable(arg3,&var[24+24+17-1+i]);
	datatree->SetBranchAddress(arg1, &dvar[24+24-1+i]);
//	datatree->SetBranchAddress(arg3, &dvar[24+24+17-1+i]);
}
for(int i=1; i<17 ; i++){
		char* tname[10];
		char* tname2[10];
		char* bname[10];
		char* bname2[10];
		TString arg1; 		TString arg2; 		TString arg3; 		TString arg4; 
		sprintf(tname,"h3t%i",i);
		sprintf(tname2,"h3t%i/F",i);
		sprintf(bname,"h3b%i",i);
		sprintf(bname2,"h3b%i/F",i);
		arg1.Form(tname);			arg2.Form(tname2);			arg3.Form(bname);			arg4.Form(bname2);
		tree->Branch(arg1 ,&dvar[24+24+17-1+i+17],arg2);
//		t3->Branch(arg1 ,&hf3t[i],arg2);
//		tree->Branch(arg3 ,&dvar[24+24+17-1+i+17+17],arg4);
	reader->AddVariable(arg1,&var[24+24+17-1+i+17]);
//	reader->AddVariable(arg3,&var[24+24+17-1+i+17+17]);
	datatree->SetBranchAddress(arg1, &dvar[24+24+17-1+i+17]);
//	datatree->SetBranchAddress(arg3, &dvar[24+24+17-1+i+17+17]);
}
for(int i=1; i<17 ; i++){
		char* tname[10];
		char* tname2[10];
		char* bname[10];
		char* bname2[10];
		TString arg1; 		TString arg2; 		TString arg3; 		TString arg4; 
		sprintf(tname,"h4tu%i",i);
		sprintf(tname2,"h4tu%i/F",i);
		sprintf(bname,"h4bu%i",i);
		sprintf(bname2,"h4bu%i/F",i);
		arg1.Form(tname);			arg2.Form(tname2);			arg3.Form(bname);			arg4.Form(bname2);
		tree->Branch(arg1 ,&dvar[24+24+17-1+i+17+17+17],arg2);

//		tree->Branch(arg3 ,&dvar[24+24+17-1+i+17+17+16],arg4);
	reader->AddVariable(arg1,&var[24+24+17-1+i+17+17+17]);
//	reader->AddVariable(arg3,&var[24+24+17-1+i+17+17+16]);
	datatree->SetBranchAddress(arg1, &dvar[24+24+17-1+i+17+17+17]);
//	datatree->SetBranchAddress(arg3, &dvar[24+24+17-1+i+17+17+16]);
}
/*for(int i=1; i<17 ; i++){
		char* tname[10];
		char* tname2[10];
		char* bname[10];
		char* bname2[10];
		TString arg1; 		TString arg2; 		TString arg3; 		TString arg4; 
		sprintf(tname,"h4td%i",i);
		sprintf(tname2,"h4td%i/F",i);
		sprintf(bname,"h4bd%i",i);
		sprintf(bname2,"h4bd%i/F",i);
		arg1.Form(tname);			arg2.Form(tname2);			arg3.Form(bname);			arg4.Form(bname2);
		tree->Branch(arg1 ,&dvar[24+24+17-1+i+17+17+17],arg2);

//		tree->Branch(arg3 ,&dvar[24+24+17-1+i+17+17+16],arg4);
	reader->AddVariable(arg1,&var[24+24+17-1+i+17+17+17]);
//	reader->AddVariable(arg3,&var[24+24+17-1+i+17+17+16]);
	datatree->SetBranchAddress(arg1, &dvar[24+24+17-1+i+17+17+17]);
//	datatree->SetBranchAddress(arg3, &dvar[24+24+17-1+i+17+17+16]);
}*/
int matrix;


  reader->BookMVA("BDT method", "TMVAClassification_BDT.weights.xml");  

TH1F * h1= new TH1F("h1","road response distribution",100,-1,1);

tree->Branch("dimuon", &matrix,"dimuon/I");
datatree->SetBranchAddress("dimuon",&matrix);

 for (Long64_t ievt=0; ievt<(datatree->GetEntries());ievt++) {

    if (ievt%1000 == 0) std::cout << "--- ... Processing event: " << ievt <<std::endl;
    
    datatree->GetEntry(ievt);

    for(int j=0; j<n; j++){
	var[j]=dvar[j];
	}
	
    BDT_response=reader->EvaluateMVA("BDT method");
	h1->Fill(BDT_response);
    tree->Fill();

  }
  h1->Draw();
  tree->Write();
}
