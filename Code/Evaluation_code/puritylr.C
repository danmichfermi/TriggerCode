//
//top 3  sigma 1
//top  4 sigma2
//Extended evaluation code which includes purity

void puritylr(){
	TCanvas* c1 = new TCanvas("c1", "c1"); 

	TFile *target = new TFile("n3_m2_bot.root","READ" ); 
	TFile *data= new TFile("birealdata_matrix2_com.root", "READ");
	TTree * t1= target->Get("signal");
	TTree *t2= data->Get("background");
	float sep;
	int dimuon; 
	float purity;
	t1->SetBranchAddress("LRbot_M2_N3MC_sigma_true", &sep);
	t2->SetBranchAddress("LRbot_M2_N3MC_sigma_true", &sep);
//	t1->SetBranchAddress("dimuon", &dimuon);
	TH1F *h1= new TH1F("h1","Dimuon response distribution", 500, -.6,.4);
	TH1F *h2= new TH1F("h2","Background response distribution",500, -.6,.4);
	TH1F *h3= new TH1F("h3","Dimuon Cut distribution", 500, -.6,.4);
	TH1F *h4= new TH1F("h4","Backgrund Cut distribution", 500, -.6, .4);
	TH1F *h5= new TH1F("h5","Purity", 500, -.6, .4);
	TH1F *h6= new TH1F("h6","Purity", 500, -.6, .4);
	TH2F *h2d= new TH2F("h2d","Mass and BDT Signal Response",100,-1,-.5,100,0,10);
	for(int i=0; i< (t1->GetEntries())  ; i++){
		t1->GetEntry(i);
		h1->Fill(sep);
	}
	for(int i=0; i< (t2->GetEntries())  ; i++){
		t2->GetEntry(i);
		h2->Fill(sep);
	}
	bool first=false;
	float prevsig[5]={0,0,0,0,0};
	float prevbac[5]={0,0,0,0,0};
	float prevcut[5]={0,0,0,0,0};
	int dtotal = h1->Integral();
	int btotal = h2->Integral();
	cout<<dtotal<<endl;
	cout<<btotal<<endl;
	h1->Draw();
	h2->Draw("same");
	for(int i=0; i<500; i++){
		float x =-.6+ i*.002;
		float her; 
		her =(h1->Integral(i, 500 ));
		float ver = (h2->Integral(0, i+1));
		float hert=her/dtotal;
		float vert=ver/btotal;
		if((hert+(1-vert))>0) float pure=hert/(hert+(1-vert));
		else pure=0;
//		cout<<pure<<endl;
//		if((x>-.45)&&(x<.4)) cout<< x<<"\t"<<ver/btotal"\t"<<her/dtotal<<endl;
		if((her/dtotal<.999)&&(her/dtotal>.001)){ 
			if(!first){
				for(int k=0; k<5 ; k++){
//					cout<<prevcut[k]<<"\t"<<"\t"<<prevsig[k]<<"\t"<<"    \t"<<prevbac[k]<<"\t"<<"  \t"<<pure<<endl;
				}
			}
			cout<<x<<"\t"<<hert<<"\t"<<vert<<"\t"<<pure<<endl;
			first=true;
		}	
//		for(int k=0; k<4 ; k++){
//			prevbac[k]=prevbac[k+1];
//			prevsig[k]=prevsig[k+1];
//			prevcut[k]=prevcut[k+1];				
	//	}
//			prevbac[5]=ver/btotal;
//			prevsig[5]=her/dtotal;
//			prevcut[5]=x;
		h3->Fill(x+.001, hert);
		h4->Fill(x+.001, vert);
		h5->Fill(x+.001, pure);		
	}

	h1->SetLineColor(kBlue);
	h2->SetLineColor(kRed);
	c1->SaveAs("mcn3_resp_lrbot_sig.png");	

	TCanvas* c2 = new TCanvas("c2", "c2"); 
	h3->Draw();
	h4->Draw("same");
	h5->Draw("same");
	h3->SetLineColor(kBlue);
	h4->SetLineColor(kRed);
	h5->SetLineColor(kGreen);
	h5->SetLineStyle(2);
	c2->SaveAs("realdata_resp_mcn3_lrbot_sig2.png");		
}
