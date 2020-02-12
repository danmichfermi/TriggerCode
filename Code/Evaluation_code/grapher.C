void grapher(){
	TCanvas* c1 = new TCanvas("c1", "c1"); 
	TFile *target = new TFile("BDTMATRIX1v3.root","READ" );
	TTree * t1= target->Get("signal");
	TTree * t1= target->Get("background");
	float sep;
	int dimuon; 
	float mass;
	float backgroundrejcetion[200];
	float signal[200];
	t1->SetBranchAddress("BDT_response", &sep);
	t1->SetBranchAddress("dimuon", &dimuon);
//	t1->SetBranchAddress("mass", &mass);
	TH1F *h1= new TH1F("h1","Dimuon response distribution", 100, -1.0,1.0);
	TH1F *h2= new TH1F("h2","Backgrund response distribution",100, -1,1);
	TH1F *h3= new TH1F("h3","Dimuon Cut distribution", 100, -1,1);
	TH1F *h4= new TH1F("h4","Backgrund Cut distribution", 100, -1,1);
	TH1F *h3= new TH1F("h5"," Mass Dimuon Cut distribution", 100, -1,1);
	TH1F *h4= new TH1F("h4","High Mass response", 100, -1,1);
	for(int i=0; i< (t1->GetEntries())  ; i++){	
		t1->GetEntry(i);
		if(dimuon>0) h1->Fill(sep);
		else h2->Fill(sep);
		if(mass>2.0) h4->Fill(sep);
	}
	bool first=false;
	float prevsig[5]={0,0,0,0,0};
	float prevbac[5]={0,0,0,0,0};
	float prevcut[5]={0,0,0,0,0};
	int dtotal = h1->Integral();
	int btotal = h2->Integral();
	int mtotal= h4->Integral();
//	h1->Draw();
//	h2->Draw("same");
	h2->Draw("");
	for(int i=0; i<100; i++){
		float x =-1.0+ i*.02;
		float her;
		her =(h1->Integral(i, 100 ));
		float ver = (h2->Integral(0, i+1));
		float mer = (h4->Integral(i);
		if((x>-.25)&&(x<.2)){ cout<< x<<"\t"<<ver/btotal<<endl;}
/*	if((her/dtotal<.999)&&(her/dtotal>.001)){ 
			if(!first){
				for(int k=0; k<5 ; k++){
					cout<<prevcut[k]<<"\t"<<prevsig[k]<<"\t"<<prevbac[k]<<endl;
				}
			}
			cout<<x<<"\t"<<(her/dtotal)<<"\t"<<(ver/btotal)<<endl;
			first=true;
		}
		
		for(int k=0; k<4 ; k++){
			prevbac[k]=prevbac[k+1];
			prevsig[k]=prevsig[k+1];
			prevcut[k]=prevcut[k+1];				
		}
			prevbac[5]=ver/btotal;
			prevsig[5]=her/dtotal;
			prevcut[5]=x;	*/	
//		h3->Fill(x+.001, her/dtotal);
		h4->Fill(x+.001, ver/btotal);
	}
	cout<<dtotal<<endl;
	cout<<btotal<<endl;
	h1->SetLineColor(kRed);
	h2->SetLineColor(kBlue);
	c1->SaveAs("9713_1000_Dimuon.png");		
//	h3->Draw();
//	h4->Draw("same");
	h4->Draw();
	h3->SetLineColor(kRed);
	h4->SetLineColor(kBlue);
	c1->SaveAs("9713_1000_BackgroundCuts.png");		
}
