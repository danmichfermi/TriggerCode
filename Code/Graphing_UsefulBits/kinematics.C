void kinematics(){

TFile *simulate= new TFile("MonteCarloBinaryCharge.root","READ");
TTree *mcTree= (TTree *) simulate->Get("mc_drellyan_LD2_M020_S001");
float mass;
float xT;
float weight;
float xTratio=0;
float massratio;
float massm2;
float xTm2=0;
float weight1=0;
float weight2=0;
int matrix1;
int matrix2;
mcTree->SetBranchAddress("mass", &mass);
mcTree->SetBranchAddress("xT", &xT);
mcTree->SetBranchAddress("sigWeight", &weight);
mcTree->SetBranchAddress("matrix1true", &matrix1);
mcTree->SetBranchAddress("matrix2true", &matrix2);
TH1F *hmcmat= new TH1F("hmcmat","MC Mat1 Mass",32,2.0,10.0);
TH1F *hmcmat2= new TH1F("hmcmat2","MC Mat2 Mass",32,2.0,10.0);
for(int i=0; i<mcTree->GetEntries(); i++){
	mcTree->GetEntry(i);
	if(matrix1>0){ hmcmat->Fill(mass, weight); 
//		cout<<mass<<endl;
		if(mass>0){weight1+=weight;}
		if(xT>.3) xTratio+=weight;
	}
	if(matrix2>0){  hmcmat2->Fill(mass,weight);
		if(mass>0){ weight2+=weight;}
		if(xT>.3)  xTm2+=weight;
	}
}
massratio=weight1/weight2;
xTratio=xTratio/xTm2;
cout<<massratio<<endl;
cout<<xTratio<<endl;
hmcmat2->Draw();
}
