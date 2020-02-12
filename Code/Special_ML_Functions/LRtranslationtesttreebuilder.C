//Part of the Non-bend trigger project
//Code designed to make special trees for the purpose of testing BDT weight translation code
//In its current form produces all 0's or 1's

void LRtranslationtesttreebuilder(){

//Standard initilization
	TFile *f= new TFile("evenoddtest.root","RECREATE");
	TTree *t1= new TTree("signal","matrix signal");
	const int H1MAX=24;
	const int H2MAX=24;
	const int H3MAX=24;
	const int H4MAX=24;
	int h1r[H1MAX];
	int h2r[H2MAX];
	int h1l[H1MAX];
	int h2l[H2MAX];
	int h4Y1L[H4MAX];
	int h4Y2L[H4MAX];
	int h4Y1R[H4MAX];
	int h4Y2R[H4MAX];
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
		t1->Branch(arg5 ,&h1l[i],arg6);
		t1->Branch(arg7 ,&h1r[i],arg8);
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
		sprintf(tname,"h2t%i",i);
		sprintf(tname2,"h2t%i/I",i);
		sprintf(bname,"h2b%i",i);
		sprintf(bname2,"h2b%i/I",i);
		sprintf(lname,"h2l%i",i);
		sprintf(lname2,"h2l%i/I",i);
		sprintf(rname,"h2r%i",i);
		sprintf(rname2,"h2r%i/I",i);
		arg1.Form(tname);			arg2.Form(tname2);			arg3.Form(bname);			arg4.Form(bname2);
		arg5.Form(lname);			arg6.Form(lname2);			arg7.Form(rname);			arg8.Form(rname2);
		t1->Branch(arg5 ,&h2l[i],arg6);
		t1->Branch(arg7 ,&h2r[i],arg8);

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
		t1->Branch(arg13 ,&h4Y1R[i], arg8);
		t1->Branch(arg14 ,&h4Y1L[i], arg6);
		t1->Branch(arg15 ,&h4Y2R[i], arg12);//		else {g[i]=(TTree *)f1->Get(table[i]); }
		t1->Branch(arg16 ,&h4Y2L[i], arg10);
	}
	int odd;
	for(int i=1; i<H1MAX ; i++){
		if(i%2){ odd=1;
		}
		else odd=0;
		 h1r[i]=odd;
		 h2r[i]=odd;
		 h1l[i]=odd;
		 h2l[i]=odd;
		 h4Y1L[ i]=odd;
		 h4Y2L[ i]=odd;
		 h4Y1R[ i]=odd;
		 h4Y2R[ i]=odd;
	}
	t1->Fill();
	t1->Fill();			//performed twice to see if there is any dependency on previous values
	for(int i=1; i<H1MAX ; i++){
		if(i%2){ odd=0;
		}
		else odd=1;
		 h1r[i]=odd;
		 h2r[i]=odd;
		 h1l[i]=odd;
		 h2l[i]=odd;
		 h4Y1L[ i]=odd;
		 h4Y2L[ i]=odd;
		 h4Y1R[ i]=odd;
		 h4Y2R[ i]=odd;
	}
	for(int i=1; i<H1MAX ; i++){
		odd=1;
		 h1r[i]=odd;
		 h2r[i]=0;
		 h1l[i]=odd;
		 h2l[i]=0;
		 h4Y1L[ i]=odd;
		 h4Y2L[ i]=odd;
		 h4Y1R[ i]=odd;
		 h4Y2R[ i]=odd;
	}
	t1->Fill();
	f->Write();
}
	

