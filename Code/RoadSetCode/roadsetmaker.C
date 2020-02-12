void roadsetmaker(){

	TFile *f= new TFile("roadsetbot.root","RECREATE");
	TTree *t1= new TTree("roadset","all roadsets");
	float h1b[24];
	float h2b[17];
	float h3b[17];	
	float h4bu[17];	
	float h4bd[17];	
for(int i=1; i<24 ; i++){
	char* tname[10];
	char* bname[10];
	sprintf(tname,"h1b%i",i);
	sprintf(bname,"h1b%i/F",i);
	TString arg1; 		TString arg2; 
	arg1.Form(tname);			arg2.Form(bname);	
	t1-> Branch(arg1,&h1b[i],arg2);
//	factory->AddVariable(arg2,'/F');
}
for(int i=1; i<17 ; i++){
	char* tname[10];
	char* bname[10];
	sprintf(tname,"h2b%i",i);
	sprintf(bname,"h2b%i/F",i);
	TString arg1; 		TString arg2; 
	arg1.Form(tname);			arg2.Form(bname);	
	t1-> Branch(arg1,&h2b[i],arg2);
//	factory->AddVariable(arg2,'/F');
}
for(int i=1; i<17 ; i++){
	char* tname[10];
	char* bname[10];
	sprintf(tname,"h3b%i",i);
	sprintf(bname,"h3b%i/F",i);
	TString arg1; 		TString arg2; 
	arg1.Form(tname);			arg2.Form(bname);	
	t1-> Branch(arg1,&h3b[i],arg2);
//	factory->AddVariable(arg2,'/F');
}
for(int i=1; i<17 ; i++){
	char* tname[10];
	char* bname[10];
	sprintf(tname,"h4bu%i",i);
	sprintf(bname,"h4bu%i/F",i);
	TString arg1; 		TString arg2; 
	arg1.Form(tname);			arg2.Form(bname);	
	t1-> Branch(arg1,&h4bu[i],arg2);
//	factory->AddVariable(arg2,'/F');
}
for(int i=1; i<17 ; i++){
	char* tname[10];
	char* bname[10];
	sprintf(tname,"h4bd%i",i);
	sprintf(bname,"h4bd%i/F",i);
	TString arg1; 		TString arg2; 
	arg1.Form(tname);			arg2.Form(bname);	
	t1-> Branch(arg1,&h4bd[i],arg2);
//	factory->AddVariable(arg2,'/F');
}
	
	for(int i=1;i<24 ; i++){
		for(int j=1; j<17; j++){
			for(int k=1; k<17; k++){
				for(int l=1; l<17; l++){
						for(int in=1;in<24 ; in++){
							if( i==in)  h1b[i]=1;
							else h1b[in]=0;
						}
						for(int jn=1;jn<17 ; jn++){
							if( j==jn)  h2b[j]=1;
							else h2b[jn]=0;
						}
						for(int kn=1;kn<17 ; kn++){
							if( k==kn)  h3b[k]=1;
							else h3b[kn]=0;
						}
						for(int ln=1;ln<17 ; ln++){
							if( l==ln){  
								h4bu[l]=1;
								h4bd[l]=1;
							}
							else{ 
								h4bu[ln]=0;
								h4bd[ln]=0;
							}
						}
						t1->Fill();
					
				}
			}
		}
	cout<<i<<endl;
	}
	t1->Write();
}
