void simplesep(){
	TFile *f= new TFile("mc_mat1_tree.root","READ");
	TTree *t1= (TTree*) f->Get("signal");
	TTree *t2= (TTree*) f->Get("background");
	TFile hfile(".root","RECREATE");
	const int H1MAX=24;  // plus one to avoid shifting indices later
	const int H2MAX=17;
	const int H3MAX=17;
	const int H4MAX=17;

	int h1ts;
	int h2ts;
	int h3ts;
	int h4ts;
	int h1bs;
	int h2bs;
	int h3bs;
	int h4bs;

	int h1t[H1MAX];
	int h2t[H2MAX];
	int h3t[H3MAX];
	int h4t[H4MAX];
	int h1b[H1MAX];
	int h2b[H2MAX];
	int h3b[H3MAX];
	int h4b[H4MAX];

	int eid;
	int MAT1, MAT2, MAT3, MAT4, MAT5;
	double mass;
	double xf;
double dz;
	double dpx, dpy, dpz;
	double t1z0, t1px0, t1py0, t1pz0;
	double t2z0, t2px0, t2py0, t2pz0;
	int q1, q2;
	t1->SetBranchAddress("MAT1",&MAT1);
	t1->SetBranchAddress("eventID",&eid);
	t1->SetBranchAddress("eventID",&eid);
	t1->SetBranchAddress("h1t",h1t);
	t1->SetBranchAddress("h2t",h2t);
	t1->SetBranchAddress("h3t",h3t);
	t1->SetBranchAddress("h4t",h4t);
	t1->SetBranchAddress("h1b",h1b);
	t1->SetBranchAddress("h2b",h2b);
	t1->SetBranchAddress("h3b",h3b);
	t1->SetBranchAddress("h4b",h4b);
	t1->SetBranchAddress("q1",&q1);
	t1->SetBranchAddress("q2",&q2);
	t1->SetBranchAddress("MAT1",&MAT1);
	t1->SetBranchAddress("MAT2",&MAT2);
	t1->SetBranchAddress("MAT3",&MAT3);
	t1->SetBranchAddress("MAT4",&MAT4);
	t1->SetBranchAddress("MAT5",&MAT5);

	TTree *t2= new TTree("signal", "signal");
	TTree *t3= new TTree("background", "background");
	t2->Branch("eventID",&eid,"eid/I");
	t3->Branch("eventID",&eid,"eid/I");
/*	for(int i=1; i<24; i++){
		char* tname[10];
		char* tname2[10];
		char* bname[10];
		char* bname2[10];
		TString arg1; 		TString arg2; 		TString arg3; 		TString arg4; 
		arg1.Form(tname);			arg2.Form(tname2);			arg3.Form(bname);			arg4.Form(bname2);
		sprintf(tname,"h1t%i",i);
		sprintf(tname2,"h1t%i/I",i);
		sprintf(bname,"h1b%i",i);
		sprintf(bname2,"h1b%i/I",i);
		t2->Branch(arg1 ,&h1t[i],arg2);
		t3->Branch(arg1 ,&h1t[i],arg2);
		t2->Branch(arg3 ,&h1b[i],arg4);
		t3->Branch(arg3 ,&h1b[i],arg4);
	}1111111
	for(int i=1; i<17; i++){
		char* tname[10];
		char* tname2[10];
		char* bname[10];
		char* bname2[10];
		TString arg1; 		TString arg2; 		TString arg3; 		TString arg4; 
		arg1.Form(tname);			arg2.Form(tname2);			arg3.Form(bname);			arg4.Form(bname2);

		sprintf(tname,"h2t%i",i);
		sprintf(tname2,"h2t%i/I",i);
		sprintf(bname,"h2b%i",i);
		sprintf(bname2,"h2b%i/I",i);
		t2->Branch(arg1 ,&h2t[i],arg2);
		t3->Branch(arg1 ,&h2t[i],arg2);
		t2->Branch(arg3 ,&h2b[i],arg4);
		t3->Branch(arg3 ,&h2b[i],arg4);
	}
	for(int i=1; i<17; i++){
		char* tname[10];
		char* tname2[10];
		char* bname[10];
		char* bname2[10];
		TString arg1; 		TString arg2; 		TString arg3; 		TString arg4; 
		arg1.Form(tname);			arg2.Form(tname2);			arg3.Form(bname);			arg4.Form(bname2);
		sprintf(tname,"h3t%i",i);
		sprintf(tname2,"h3t%i/I",i);
		sprintf(bname,"h3b%i",i);
		sprintf(bname2,"h3b%i/I",i);
		t2->Branch(arg1 ,&h3t[i],arg2);
		t3->Branch(arg1 ,&h3t[i],arg2);
		t2->Branch(arg3 ,&h3b[i],arg4);
		t3->Branch(arg3 ,&h3b[i],arg4);
	}
	for(int i=1; i<17; i++){
		char* tname[10];
		char* tname2[10];
		char* bname[10];
		char* bname2[10];
		TString arg1; 		TString arg2; 		TString arg3; 		TString arg4; 
		arg1.Form(tname);			arg2.Form(tname2);			arg3.Form(bname);			arg4.Form(bname2);
		sprintf(tname,"h4t%i",i);
		sprintf(tname2,"h4t%i/I",i);
		sprintf(bname,"h4b%i",i);
		sprintf(bname2,"h4b%i/I",i);
		t2->Branch(arg1 ,&h4t[i],arg2);
		t3->Branch(arg1 ,&h4t[i],arg2);
		t2->Branch(arg3 ,&h4b[i],arg4);
		t3->Branch(arg3 ,&h4b[i],arg4);
	}
	t2->Branch("q1",&q1,"q1/I");
	t2->Branch("q2",&q2,"q2/I");
	t2->Branch("MAT1",&MAT1,"MAT1/I");
	t2->Branch("MAT2",&MAT2,"MAT2/I");
	t2->Branch("MAT3",&MAT3,"MAT3/I");
	t2->Branch("MAT4",&MAT4,"MAT4/I");
	t2->Branch("MAT5",&MAT5,"MAT5/I");*/
	t2->Branch("eventID",&eid,"eid/I");
	t3->Branch("eventID",&eid,"eid/I");

	t2->Branch("h1t",&h1ts,"h1t/I");
	t2->Branch("h2t",&h2ts,"h2t/I");
	t2->Branch("h3t",&h3ts,"h3t/I");
	t2->Branch("h4t",&h4ts,"h4t/I");
	t2->Branch("h1b",&h1bs,"h1b/I");
	t2->Branch("h2b",&h2bs,"h2b/I");
	t2->Branch("h3b",&h3bs,"h3b/I");
	t2->Branch("h4b",&h4bs,"h4b/I");

	t3->Branch("h1t",&h1ts,"h1t/I");
	t3->Branch("h2t",&h2ts,"h2t/I");
	t3->Branch("h3t",&h3ts,"h3t/I");
	t3->Branch("h4t",&h4ts,"h4t/I");
	t3->Branch("h1b",&h1bs,"h1b/I");
	t3->Branch("h2b",&h2bs,"h2b/I");
	t3->Branch("h3b",&h3bs,"h3b/I");
	t3->Branch("h4b",&h4bs,"h4b/I");
/*	t3->Branch("MAT1",&MAT1,"MAT1/I");
	t3->Branch("MAT2",&MAT2,"MAT2/I");
	t3->Branch("MAT3",&MAT3,"MAT3/I");
	t3->Branch("MAT4",&MAT4,"MAT4/I");
	t3->Branch("MAT5",&MAT5,"MAT5/I");*/
	float total=t1->GetEntries();
	cout<<total<<endl;
	float top[4]={0,0,0,0};
	float bot[4]={0,0,0,0};
	
	if()
	for(int i=0; i< total; i++){
		if(!(i % 1000)) cout<<"working"<<endl;
		int sum=0;
		bool pass =true;
		int sumt[4]={0,0,0,0};
		int sumb[4]={0,0,0,0};
		t1->GetEntry(i);
//		cout<<"k"<<endl;
		for(int j=1; j<24; j++){
			sumt[0]+= h1t[j];
			if(sumt[0]>0) h1ts=1;
			else {h1ts=0; pass=false;}
			sumb[0]= h1b[j];
			if(sumb[0]>0) h1bs=1;
			else {h1bs=0; pass=false;}
		}
//		cout<<"ok"<<endl;
		for(int j=1; j<17; j++){
			sumt[1]+= h2t[j];
			if(sumt[1]>0) h2ts=1;
			else {h2ts=0; pass=false;}
			sumb[1]+= h2b[j];
			if(sumb[1]>0) h2bs=1;
			else {h2bs=0; pass=false;}
		sumt[2]+= h3t[j];
			if(sumt[2]>0) h3ts=1;
			else {h3ts=0; pass=false;}
			sumb[2]+= h3b[j];
			if(sumb[2]>0) h3bs=1;
			else {h3bs=0; pass=false;}
			sumb[3]+= h4b[j];
			if(sumb[3]>0) h4bs=1;
			else {h4bs=0; pass=false;}
			sumt[3]+= h4t[j];
			if(sumt[3]>0) h4ts=1;
			else {h4ts=0; pass=false;}
		}
		if(sumt[0]>1) top[0]++;
		if(sumt[1]>1) top[1]++;
		if(sumt[2]>1) top[2]++;
		if(sumt[3]>1) top[3]++;
		if(sumb[0]>1) bot[0]++;
		if(sumb[1]>1) bot[1]++;
		if(sumb[2]>1) bot[2]++;
		if(sumb[3]>1) bot[3]++;

		if(pass){
		t2->Fill();}
		else{
		t3->Fill();}
	}
		for(int k=0; k<4 ; k++){
			cout<<(top[k]/total)<<endl; 
			cout<<(bot[k]/total)<<endl; 
		}
	t2->Write();
	t3->Write();

}
