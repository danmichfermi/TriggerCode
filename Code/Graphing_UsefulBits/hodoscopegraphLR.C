void hodoscopegraphLR(){
	TCanvas* c1 = new TCanvas("c1", "c1"); 

	TFile *file1 = new TFile("MonteCarloTreesBinary_new.root", "READ");
	TFile *file2 = new TFile("MCmeanedbinary.root","READ");
	TTree *t1= (TTree *) file1->Get("mc_drellyan_LD2_M017_S001");
	TTree * t2 = (TTree *) file2 -> Get("signal");
	
	const int H1MAX=24;  // plus one to avoid shifting indices later
	const int H2MAX=24;
	const int H3MAX=24;
	const int H4MAX=17;

	int h1t[H1MAX];
	int h2t[H2MAX];
	int h3t[H3MAX];
	int h4tu[H4MAX];
	int h4td[H4MAX];
	int h1b[H1MAX];
	int h2b[H2MAX];
	int h3b[H3MAX];
	int h4bu[H4MAX];
	int h4bd[H4MAX];
	int h1l[H1MAX];
	int h2l[H2MAX];
	int h3l[H3MAX];
	int h4lu[H4MAX];
	int h4ld[H4MAX];
	int h4Y1Ll[H4MAX];
	int h4Y1Lr[H4MAX];
	int h4Y2Ll[H4MAX];
	int h4Y2Lr[H4MAX];
	int h4Y1Rl[H4MAX];
	int h4Y1Rr[H4MAX];
	int h4Y2Rl[H4MAX];
	int h4Y2Rr[H4MAX];
	int h1r[H1MAX];
	int h2r[H2MAX];
	int h4Y1L[H4MAX];
	int h4Y2L[H4MAX];
	int h4Y1R[H4MAX];
	int h4Y2R[H4MAX];

	TH1I *hh1r= new TH1I("hh1r","Station One Right",48 , -H1MAX, H2MAX) ;
	TH1I *hh1l= new TH1I("hh1l","Station One Left" , 48, -H1MAX, H2MAX) ;
	TH1I *hh2r= new TH1I("hh2r","Station Two Right",48  , -H1MAX, H2MAX) ;
	TH1I *hh2l= new TH1I("hh2l","Station Two Left",48 , -H1MAX, H2MAX) ;
	TH1I *hh4R1= new TH1I("hh4R1","Station Four Right 1", 34 , -H4MAX, H4MAX) ;
	TH1I *hh4L1= new TH1I("hh4L1","Station Four Left 1", 34 , -H4MAX, H4MAX) ;
	TH1I *hh4R2= new TH1I("hh4R2","Station Four Right 2", 34, -H4MAX, H4MAX) ;
	TH1I *hh4L2= new TH1I("hh4L2","Station Four Left 2", 34 , -H4MAX, H4MAX) ;
	for(int i=1; i<24; i++){
		char* tname[10];
		char* tname2[10];
		char* bname[10];
		char* bname2[10];
		char* lname[10];
		char* lname2[10];
		char* rname[10];
		char* rname2[10];
		TString arg1; 		TString arg2; 		TString arg3; 		TString arg4; 
		TString arg5; 		TString arg6; 		TString arg7; 		TString arg8; 
		sprintf(tname,"h1t%i",i);
		sprintf(tname2,"h1t%i/I",i);
		sprintf(bname,"h1b%i",i);
		sprintf(bname2,"h1b%i/I",i);
		sprintf(lname,"h1l%i",i);
		sprintf(lname2,"h1l%i/I",i);
		sprintf(rname,"h1r%i",i);
		sprintf(rname2,"h1r%i/I",i);
		arg1.Form(tname);			arg2.Form(tname2);			arg3.Form(bname);			arg4.Form(bname2);
		arg5.Form(lname);			arg6.Form(lname2);			arg7.Form(rname);			arg8.Form(rname2);
		t1->SetBranchAddress(arg1 ,&h1t[i]);
		t1->SetBranchAddress(arg3 ,&h1b[i]);
		t1->SetBranchAddress(arg5 ,&h1l[i]);
		t1->SetBranchAddress(arg7 ,&h1r[i]);
		t2->SetBranchAddress(arg1 ,&h1t[i]);
		t2->SetBranchAddress(arg3 ,&h1b[i]);
		t2->SetBranchAddress(arg5 ,&h1l[i]);
		t2->SetBranchAddress(arg7 ,&h1r[i]);
	}
	for(int i=1; i<24; i++){
		char* tname[10];
		char* tname2[10];
		char* bname[10];
		char* bname2[10];
		char* lname[10];
		char* lname2[10];
		char* rname[10];
		char* rname2[10];
		TString arg1; 		TString arg2; 		TString arg3; 		TString arg4; 
		TString arg5; 		TString arg6; 		TString arg7; 		TString arg8; 
		sprintf(tname,"h1t%i",i);
		sprintf(tname2,"h1t%i/I",i);
		sprintf(bname,"h2b%i",i);
		sprintf(bname2,"h2b%i/I",i);
		sprintf(lname,"h2l%i",i);
		sprintf(lname2,"h2l%i/I",i);
		sprintf(rname,"h2r%i",i);
		sprintf(rname2,"h2r%i/I",i);
		arg1.Form(tname);			arg2.Form(tname2);			arg3.Form(bname);			arg4.Form(bname2);
		arg5.Form(lname);			arg6.Form(lname2);			arg7.Form(rname);			arg8.Form(rname2);
		t1->SetBranchAddress(arg5 ,&h2l[i]);
		t1->SetBranchAddress(arg7 ,&h2r[i]);
		t2->SetBranchAddress(arg5 ,&h2l[i]);
		t2->SetBranchAddress(arg7 ,&h2r[i]);
	}
	for(int i=1; i<17; i++){
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
		char* fname1[10];
		char* fname2[10];
		char* fname3[10];
		char* fname4[10];
		TString arg1; 		TString arg2; 		TString arg3; 		TString arg4; 
		TString arg5; 		TString arg6; 		TString arg7; 		TString arg8; 
		TString arg9; 		TString arg10; 		TString arg11;		TString arg12; 
		TString arg13; 		TString arg14; 		TString arg15;		TString arg16; 		
		sprintf(tname,"h4tu%i",i);
		sprintf(tname2,"h4tu%i/I",i);
		sprintf(bname,"h4bu%i",i);
		sprintf(bname2,"h4bu%i/I",i);
		sprintf(rname,"h4Y1Rl%i",i);
		sprintf(rname2,"h4Y1R%i/I",i);
		sprintf(lname,"h4Y1Ll%i",i);
		sprintf(lname2,"h4Y1L%i/I",i);
		sprintf(lname3,"h4Y2Ll%i",i);
		sprintf(lname4,"h4Y2L%i/I",i);
		sprintf(rname3,"h4Y2Rl%i",i);
		sprintf(rname4,"h4Y2R%i/I",i);
		sprintf(fname1,"h4Y1R%i",i);
		sprintf(fname2,"h4Y1L%i",i);
		sprintf(fname3,"h4Y2R%i",i);
		sprintf(fname4,"h4Y2L%i",i);
		arg1.Form(tname);			arg2.Form(tname2);			arg3.Form(bname);			arg4.Form(bname2);
		arg5.Form(lname);			arg6.Form(lname2);			arg7.Form(rname);			arg8.Form(rname2);
		arg9.Form(lname3);			arg10.Form(lname4);			arg11.Form(rname3);			arg12.Form(rname4);
		arg13.Form(fname1);			arg14.Form(fname2);			arg15.Form(fname3);			arg16.Form(fname4);
		t1->SetBranchAddress(arg5 ,&h4Y1Ll[i]);
		t1->SetBranchAddress(arg7 ,&h4Y1Rl[i]);
		t1->SetBranchAddress(arg9 ,&h4Y2Ll[i]);
		t1->SetBranchAddress(arg11 ,&h4Y2Rl[i]);
		t2->SetBranchAddress(arg14 ,&h4Y1L[i]);
		t2->SetBranchAddress(arg13 ,&h4Y1R[i]);
		t2->SetBranchAddress(arg16 ,&h4Y2L[i]);
		t2->SetBranchAddress(arg15 ,&h4Y2R[i]);
	}
	for(int i=1; i<17; i++){
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
		sprintf(rname,"h4Y1Rr%i",i);
		sprintf(rname2,"h4Y1Rr%i/I",i);
		sprintf(lname,"h4Y1Lr%i",i);
		sprintf(lname2,"h4Y1Lr%i/I",i);
		sprintf(lname3,"h4Y2Lr%i",i);
		sprintf(lname4,"h4Y2Lr%i/I",i);
		sprintf(rname3,"h4Y2Rr%i",i);
		sprintf(rname4,"h4Y2Rr%i/I",i);
		arg1.Form(tname);			arg2.Form(tname2);			arg3.Form(bname);			arg4.Form(bname2);
		arg5.Form(lname);			arg6.Form(lname2);			arg7.Form(rname);			arg8.Form(rname2);
		arg9.Form(lname3);			arg10.Form(lname4);			arg11.Form(rname3);			arg12.Form(rname4);
		t1->SetBranchAddress(arg5 ,&h4Y1Lr[i]);
		t1->SetBranchAddress(arg7 ,&h4Y1Rr[i]);
		t1->SetBranchAddress(arg9 ,&h4Y2Lr[i]);
		t1->SetBranchAddress(arg11 ,&h4Y2Rr[i]);
	}
	int limit;
	if(t1->GetEntries() < t2->GetEntries()) limit = t1->GetEntries();
	else limit = t2->GetEntries();
	for(int i=0; i<limit; i++){
		t1->GetEntry(i);
		vector<int> hl1;
		vector<int> hr1;
		vector<int> hl2;
		vector<int> hr2;
		vector<int> h4l1;
		vector<int> h4r1;
		vector<int> h4l2;
		vector<int> h4r2;
		for(int k=1; k<17 ; k++){
			if((h4Y1Ll[k]>0) || (h4Y1Lr[k]>0)) h4Y1L[k]=1;
			else h4Y1L[k]=0;
			if((h4Y2Ll[k]>0) || (h4Y2Lr[k]>0)) h4Y2L[k]=1;
			else h4Y2L[k]=0;
			if((h4Y1Rl[k]>0) || (h4Y1Rr[k]>0)) h4Y1R[k]=1;
			else h4Y1R[k]=0;
			if((h4Y2Rl[k]>0) || (h4Y2Rr[k]>0)) h4Y2R[k]=1;
			else h4Y2R[k]=0;
		}
		for(int j=0; j<21 ; j++){
			if(h1r[j] > 0) hr1.push_back(j);
			if(h1l[j] > 0) hl1.push_back(j);
			if(h2r[j] > 0) hr2.push_back(j);
			if(h2l[j] > 0) hl2.push_back(j);
		}
		for(int j=0; j<17 ; j++){
			if(h4Y1R[j] > 0) h4r1.push_back(j);
			if(h4Y1L[j] > 0) h4l1.push_back(j);
			if(h4Y2R[j] > 0) h4r2.push_back(j);
			if(h4Y2L[j] > 0) h4l2.push_back(j);
		}
		for(int z=0; z<hl1.size() ; z++){ hh1l->Fill(hl1[z]); }
		for(int z=0; z<hr1.size() ; z++){ hh1r->Fill(hr1[z]); }
		for(int z=0; z<hl2.size() ; z++){ hh2l->Fill(hl2[z]); }
		for(int z=0; z<hr2.size() ; z++){ hh2r->Fill(hr2[z]); }
		for(int z=0; z<h4l1.size() ; z++){ hh4L1->Fill(h4l1[z]); }
		for(int z=0; z<h4r1.size() ; z++){ hh4R1->Fill(h4r1[z]); }
		for(int z=0; z<h4l2.size() ; z++){ hh4L2->Fill(h4l2[z]); }
		for(int z=0; z<h4r2.size() ; z++){ hh4R2->Fill(h4r2[z]); }
		t2->GetEntry(i);
		vector<int> h2l1;
		vector<int> h2r1;
		vector<int> h2l2;
		vector<int> h2r2;
		vector<int> h24l1;
		vector<int> h24r1;
		vector<int> h24l2;
		vector<int> h24r2;
		for(int j=0; j<21 ; j++){
			if(h1r[j] > 0) h2r1.push_back(j);
			if(h1l[j] > 0) h2l1.push_back(j);
			if(h2r[j] > 0) h2r2.push_back(j);
			if(h2l[j] > 0) h2l2.push_back(j);
		}
		for(int j=0; j<17 ; j++){
			if(h4Y1R[j] > 0) h24r1.push_back(j);
			if(h4Y1L[j] > 0) h24l1.push_back(j);
			if(h4Y2R[j] > 0) h24r2.push_back(j);
			if(h4Y2L[j] > 0) h24l2.push_back(j);
		}
		for(int z=0; z<h2l1.size() ; z++){ hh1l->Fill(h2l1[z]-21); }
		for(int z=0; z<h2r1.size() ; z++){ hh1r->Fill(h2r1[z]-21); }
		for(int z=0; z<h2l2.size() ; z++){ hh2l->Fill(h2l2[z]-21); }
		for(int z=0; z<h2r2.size() ; z++){ hh2r->Fill(h2r2[z]-21); }
		for(int z=0; z<h24l1.size() ; z++){ hh4L1->Fill(h24l1[z]-17); }
		for(int z=0; z<h24r1.size() ; z++){ hh4R1->Fill(h24r1[z]-17); }
		for(int z=0; z<h24l2.size() ; z++){ hh4L2->Fill(h24l2[z]-17); }
		for(int z=0; z<h24r2.size() ; z++){ hh4R2->Fill(h24r2[z]-17); }
	}
	hh1r->Draw();
	c1->SaveAs("hodoscopehitsR1.png");
	hh1l->Draw();
	c1->SaveAs("hodoscopehitsL1.png");
	hh2r->Draw();
	c1->SaveAs("hodoscopehitsR2.png");
	hh2l->Draw();
	c1->SaveAs("hodoscopehitsL2.png");
	hh4R1->Draw();
	c1->SaveAs("hodoscopehits4R1.png");
	hh4L1->Draw();
	c1->SaveAs("hodoscopehits4L1.png");
	hh4R2->Draw();
	c1->SaveAs("hodoscopehits4R2.png");
	hh4L2->Draw();
	c1->SaveAs("hodoscopehits4L2.png");
}
