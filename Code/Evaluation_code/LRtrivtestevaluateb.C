void testtop() {
TCanvas* c1 = new TCanvas("c1", "c1"); 

//TFile *data= new TFile("birealdatasplit2.root","update");
//TFile *data= new TFile("NBtrigtrivtest.root","update");
TFile *data= new TFile("evenoddtest.root","update");
//TFile *data= new TFile("BDTMATRIX1v3.root","READ");
//TFile *data= new TFile("BDTMATRIX1v3.root","READ");
TTree *datatree= (TTree *) data->Get("signal");
TTree *//databack= (TTree *) data->Get("background");
 // TFile *target = new TFile("toproad.root","RECREATE" );
  TTree *tree = new TTree("ertree","treelibrated tree");

Float_t BDT_response;
//TBranch *derp =  datatree->Branch("LRbot_N3_N3MC_MC_LOW",&BDT_response,"LRbot_N3_N3MC_MC_LOW/F");
//TBranch *derps =  //databack->Branch("LRbot_N3_N3MC_MC_LOW",&BDT_response,"LRbot_N3_N3MC_MC_LOW/F");
TBranch *derp =  datatree->Branch("trivlayer2",&BDT_response,"trivlayer2/F");
//TBranch *derps =  //databack->Branch("L_N3M4_MCN3_LOW",&BDT_response,"L_N3M4_MCN3_LOW/F");
TMVA::Tools::Instance();
TMVA::Reader *reader = new TMVA::Reader( "V:Color:!Silent" );
	int lol= 2*(11+20+20+20+20+30);
	const int n= lol;
	float var[n];
	float dvar[n];
	int ivar[n];
	int entry=0;
	float mass;
//	datatree->SetBranchAddress("mass",&mass);
//	tree->Branch("mass",&mass,"mass/F");
for(int i = 11; i <21 ; i++)
{
	char* tname[10];
	char* bname[10];

	sprintf(
		     tname, 
		     "h1r%i",
		     i
		     );
	sprintf(
		     bname, 
		     "h1l%i", 
		     i
		     );

	TString arg1, arg2; 
	arg1.Form(tname);			
	arg2.Form(bname);	
	reader->AddVariable(arg1,&var[i-11]);
	reader->AddVariable(arg2,&var[i-11+11]);
	datatree->SetBranchAddress(arg1,&ivar[i-11]);
//	databack->SetBranchAddress(arg1,&ivar[i-1]);
	datatree->SetBranchAddress(arg2,&ivar[i-11+11]);
//	databack->SetBranchAddress(arg2,&ivar[i-1+11]);
}

for(int i = 10; i < 20; i++)
{
	char* tname[10];
	char* bname[10];

	sprintf(
		     tname,
		     "h2r%i",
		     i
		     );
	sprintf(
		     bname,
		     "h2l%i",
		     i
		     );

	TString arg1, arg2; 
	arg1.Form(tname);			
	arg2.Form(bname);	

	reader->AddVariable(arg1,&var[i-10+22]);
	reader->AddVariable(arg2,&var[i-10+22+10]);
	datatree->SetBranchAddress(arg1,&ivar[i-10+22]);
//	databack->SetBranchAddress(arg1,&ivar[i-1+22]);
	datatree->SetBranchAddress(arg2,&ivar[i-10+22+10]);
//	databack->SetBranchAddress(arg2,&ivar[i-1+22+10]);
}

for(int i=9; i<17; i++)
{
	char* tname[10];
	char* tname2[10];
	char* bname[10];
	char* bname2[10];
	char* lname[10];
	char* lname2[10];
	char* rname[10];
	char* rname2[10];
	char* lname3[10];
	char* lname4[10];
	char* rname3[10];
	char* rname4[10];
	TString arg1; 		TString arg2; 		TString arg3; 		TString arg4; 
	TString arg5; 		TString arg6; 		TString arg7; 		TString arg8; 
	TString arg9; 		TString arg10; 		TString arg11;		TString arg12; 
	sprintf(tname,"h4tu%i",i);
	sprintf(tname2,"h4tu%i/I",i);
	sprintf(bname,"h4bu%i",i);
	sprintf(bname2,"h4bu%i/I",i);
	sprintf(rname,"h4Y1R%i",i);
	sprintf(rname2,"h4Y1R%i/I",i);
	sprintf(lname,"h4Y1L%i",i);
	sprintf(lname2,"h4Y1L%i/I",i);
	sprintf(lname3,"h4Y2L%i",i);
	sprintf(lname4,"h4Y2L%i/I",i);
	sprintf(rname3,"h4Y2R%i",i);
	sprintf(rname4,"h4Y2Rl%i/I",i);
	arg1.Form(tname);  
	arg2.Form(tname2);			
	arg3.Form(bname);			
	arg4.Form(bname2);	
	arg5.Form(lname);			
	arg6.Form(lname2);			
	arg7.Form(rname);			
	arg8.Form(rname2);
	arg9.Form(lname3);			
	arg10.Form(lname4);			
	arg11.Form(rname3);			
	arg12.Form(rname4);
	reader->AddVariable(arg5,&var[i-9+22+20]);
	reader->AddVariable(arg7, &var[i-9+10+20+22]);
	reader->AddVariable(arg9, &var[i-9+20+20+22]);
	reader->AddVariable(arg11, &var[i-9+22+20+30]);
	datatree->SetBranchAddress(arg5,&ivar[i-9+20+22]);
	datatree->SetBranchAddress(arg7,&ivar[i-9+10+20+22]);	
	datatree->SetBranchAddress(arg9,&ivar[i-9+20+20+22]);
	datatree->SetBranchAddress(arg11,&ivar[i-9+20+22+30]);			
	//databack->SetBranchAddress(arg5,&ivar[i-1+22+18]);
	//databack->SetBranchAddress(arg7,&ivar[i-1+8+18+22]);
	//databack->SetBranchAddress(arg9,&ivar[i-1+16+18+22]);
	//databack->SetBranchAddress(arg11,&ivar[i-1+22+18+24]);
}

/*for(int i=9; i<17; i++)
{
	char* tname[10];
	char* tname2[10];
	char* bname[10];
	char* bname2[10];
	char* lname[10];
	char* lname2[10];
	char* rname[10];
	char* rname2[10];
	char* lname3[10];
	char* lname4[10];
	char* rname3[10];
	char* rname4[10];
	TString arg1; 		TString arg2; 		TString arg3; 		TString arg4; 
	TString arg5; 		TString arg6; 		TString arg7; 		TString arg8; 
	TString arg9; 		TString arg10; 		TString arg11;		TString arg12; 
	sprintf(tname,"h4td%i",i);
	sprintf(tname2,"h4td%i/I",i);
	sprintf(bname,"h4bd%i",i);
	sprintf(bname2,"h4bd%i/I",i);
	sprintf(lname,"h4Y1L%i",i);
	sprintf(lname2,"h4Y1L%i",i);
	sprintf(rname,"h4Y1R%i",i);
	sprintf(rname2,"h4Y1R%i",i);
	sprintf(lname3,"h4Y2L%i",i);
	sprintf(lname4,"h4Y2L%i",i);
	sprintf(rname3,"h4Y2R%i",i);
	sprintf(rname4,"h4Y2R%i",i);
	arg1.Form(tname);			
	arg2.Form(tname2);			
	arg3.Form(bname);			
	arg4.Form(bname2);
	arg5.Form(lname);			
	arg6.Form(lname2);			
	arg7.Form(rname);			
	arg8.Form(rname2);
	arg9.Form(lname3);			
	arg10.Form(lname4);			
	arg11.Form(rname3);			
	arg12.Form(rname4);
	reader->AddVariable(arg5,&var[i-1+22+18+24+8]);
	reader->AddVariable(arg7, &var[i-1+22+18+24+16]);
	reader->AddVariable(arg9, &var[i-1+22+18+24+24]);
	reader->AddVariable(arg11, &var[i-1+22+18+24+32]);
	datatree->SetBranchAddress(arg5,&ivar[i-1+22+18+24+8]);
	datatree->SetBranchAddress(arg7,&ivar[i-1+22+18+24+16]);	
	datatree->SetBranchAddress(arg9,&ivar[i-1+22+18+24+24]);
	datatree->SetBranchAddress(arg11,&ivar[i-1+22+18+24+32]);		
	//databack->SetBranchAddress(arg5,&ivar[i-1+22+18+24+8]);
	//databack->SetBranchAddress(arg7,&ivar[i-1+22+18+24+16]);
	//databack->SetBranchAddress(arg9,&ivar[i-1+22+18+24+24]);
	//databack->SetBranchAddress(arg11,&ivar[i-1+22+18+24+32]);
}*/
int matrix;


//reader->BookMVA("BDT method","L_lobi_17_60.xml");  
reader->BookMVA("BDT method","triv_layer2.xml");  
TH1F * h1= new TH1F("h1","BDT Response All",50,-1,1);
TH1F * h2= new TH1F("h2","BDT Response All",50,-1,1);

//tree->Branch("dimuon", &matrix,"dimuon/I");
//datatree->SetBranchAddress("dimuon",&matrix);

 for (Long64_t ievt=0; ievt<(datatree->GetEntries());ievt++) {

	if (ievt%1000 == 0) std::cout << "--- ... Processing event: " << ievt <<std::endl;    
		datatree->GetEntry(ievt);
		for(int j=0; j<n; j++){
		//	dvar[j]=ivar[j];
			var[j]=ivar[j];
		}
	
		BDT_response=reader->EvaluateMVA("BDT method");
		h1->Fill(BDT_response);
		derp->Fill();
	}
cout<<"signal done"<<endl;
 /*for (Long64_t ievt=0; ievt<(//databack->GetEntries());ievt++) {

    if (ievt%1000 == 0) std::cout << "--- ... Processing event: " << ievt <<std::endl;
    
    //databack->GetEntry(ievt);

	    for(int j=0; j<n; j++){
//		dvar[j]=ivar[j];
		var[j]=ivar[j];
	}
	
	BDT_response=reader->EvaluateMVA("BDT method");
	h1->Fill(BDT_response);
	derps->Fill();

 }*/

	h1->SetLineColor(kBlue);
	h1->Draw();
//	h2->SetLineColor(kRed);
	c1->Update();
	c1->SaveAs("AllValueResponseslrtop.png");
	datatree->Write("",TObject::kOverwrite);
	//databack->Write("",TObject::kOverwrite);
	data->Close();
}
