void roadextraction(){
	TString="";				//choose tree set to cut on
	float cut=.02; 					//choose value to cut on
	bool treed=false;				//do you want a new tree yes or no?


	float BDT_response;
	TFile* f= new TFile("roadset.root","update"); 
	TTree* roadset = (TTree*)(data->Get("roadset"));
	roadset->SetBranchAddress("", &BDT_response);
	if(treed){
}
	else{

	}
}
