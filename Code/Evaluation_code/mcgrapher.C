
void mcgrapher(){
	TCanvas* c1 = new TCanvas("c1", "c1"); 
	TFile *target = new TFile("real_data-mva_output.root","READ" ); //bot_real_8730.root
	TTree * t1= target->Get("tree");
	float sep;
	int dimuon; 
	float purity;
	t1->SetBranchAddress("BDT_response", &sep);
	t1->SetBranchAddress("dimuon", &dimuon);
	TH1F *h1= new TH1F("h1","Dimuon response distribution", 100, -1.0,0);
	TH1F *h2= new TH1F("h2","Backgrund response distribution",100, -1,0);
	TH1F *h3= new TH1F("h3","Dimuon Cut distribution", 100, -1,-.5);
	TH1F *h4= new TH1F("h4","Backgrund Cut distribution", 100, -1,-.5);
	TH2F *h2d= new TH2F("h2d","Mass and BDT Signal Response",100,-1,-.5,100,0,10);
	for(int i=0; i< (t1->GetEntries())  ; i++){	
		t1->GetEntry(i);
//		cout<<dimuon<<endl;
	//	cout<<sep<<endl;
		if(dimuon>0) h1->Fill(sep);
		else h2->Fill(sep);
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
//	h2->Draw("");
	for(int i=0; i<100; i++){
		float x =-1.0+ i*.005;
		float her; 
		her =(h1->Integral(i, 100 ));
		float ver = (h2->Integral(0, i+1));
		if((x>-.25)&&(x<.2)) cout<< x<<"\t"<<ver/btotal"\t"<<her/dtotal<<endl;
		if((her/dtotal<.999)&&(her/dtotal>.001)){ 
			if(!first){
				for(int k=0; k<5 ; k++){
					cout<<prevcut[k]<<"\t"<<prevsig[k]<<"\t"<<prevbac[k]<<endl;
				}
			}
			cout<<x<<"\t"<<(her/dtotal)<<"\t"<<(ver/btotal)<<endl;
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
		h3->Fill(x+.001, her/dtotal);
		h4->Fill(x+.001, ver/btotal);
	}

	h1->SetLineColor(kRed);
	h2->SetLineColor(kBlue);
	c1->SaveAs("mc_Dimuon_bot_8730.png");		
	h3->Draw();
	h4->Draw("same");
//1	h4->Draw();
	h3->SetLineColor(kRed);
	h4->SetLineColor(kBlue);
	c1->SaveAs("mc_BackgroundCuts_bot_8730.png");		
}
