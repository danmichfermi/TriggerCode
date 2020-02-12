//First test of grabbing real data for NN input

void treed(TString table, int entries) //has to feed in stuff
{
// *** Login Information ***
	const Char_t * host = "mysql://seaquel.physics.illinois.edu:3283/";
	//const Char_t * host = "mysql://e906-db1.fnal.gov:3306/";
	const Char_t * user = "seaguest";
	const Char_t * pass = "qqbar2mu+mu-"; 

	TSQLServer * con = TSQLServer::Connect(host, user, pass); 
	TSQLResult * res;
	TSQLRow * row;


// *** Query ***
	char *bam= new char[15];
	sprintf(bam,"%d", entries);
	TString nevent;
	nevent.Form(bam); 
	TString query = 

"SELECT d.eventID AS Dimuon, h.eventID, h.detectorName, h.elementID FROM " + table + ".Hit AS h LEFT JOIN " + table + ".jDimuon AS d ON h.eventID=d.eventID WHERE (detectorName LIKE \"H%T%\" OR detectorName LIKE \"H%B%\") AND h.eventID < " + nevent + "AND h.inTime=1 ORDER BY h.eventID";


//AND h.eventID < " + nevent + " 
// *** Initialize Inputs ***

	int dimuon = 0;

	int h1t[24];
	int h2t[17];
	int h3t[17];
	int h4tu[17];
	int h4td[17];
	int h1b[24];
	int h2b[17];
	int h3b[17];
	int h4bu[17];
	int h4bd[17];

// *** Clean Hodoscope Entries ***
	for(Int_t j = 0; j < 24; j++)
	{
		h1t[j] = 0;
		h1b[j] = 0;
	}
	for(Int_t j = 0; j < 17; j++)
	{
		h2t[j] = 0;
		h3t[j] = 0;
		h4tu[j] = 0;
		h4td[j] = 0;
		h2b[j] = 0;
		h3b[j] = 0;
		h4bu[j] = 0;
		h4bd[j] = 0;
	}

// *** Initialize TTree ***
	TTree * t = new TTree(table, "DATA");

	t->Branch("dimuon", &dimuon, "dimuon/I");

	t->Branch("h1t", h1t, "h1t[24]/I");
	t->Branch("h2t", h2t, "h2t[17]/I");
	t->Branch("h3t", h3t, "h3t[17]/I");
	t->Branch("h4tu", h4tu, "h4tu[17]/I");
	t->Branch("h4td", h4td, "h4td[17]/I");
	t->Branch("h1b", h1b, "h1b[24]/I");
	t->Branch("h2b", h2b, "h2b[17]/I");
	t->Branch("h3b", h3b, "h3b[17]/I");
	t->Branch("h4bu", h4bu, "h4bu[17]/I");
	t->Branch("h4bd", h4bd, "h4bd[17]/I");


// *** Run Query ***

	cout << "Executing Query..." << endl;
	res = con->Query(query);
	Int_t nRows = res->GetRowCount();
	cout << "Query Returned " << nRows << " results." <<  endl;

	Int_t nentries = 0;
	Int_t ID = 1;
	Int_t ind;
	for(Int_t i = 0; i < nRows; i++)
	{
		row = res->Next(); //moves to the next line
		if(!row) continue;
		nentries++;

	// *** End of Event ***
		if(!(ID == atoi(row->GetField(1))))
		{

			cout << "EVENT NUMBER " << ID << "\t\t" << "NUMBER OF HITS " << nentries << "\t\t" << "DIMUON? " << dimuon << endl;
			nentries = 0;
			t->Fill();
			
		// *** Clean Hodoscope Entries ***
			for(Int_t j = 0; j < 24; j++)
			{
				h1t[j] = 0;
				h1b[j] = 0;
			}
			for(Int_t j = 0; j < 17; j++)
			{
				h2t[j] = 0;
				h3t[j] = 0;
				h4tu[j] = 0;
				h4td[j] = 0;
				h2b[j] = 0;
				h3b[j] = 0;
				h4bu[j] = 0;
				h4bd[j] = 0;
			}

			ID = atoi(row->GetField(1));
		}


	// *** Fill Hodoscopes ***
		ind=atoi(row->GetField(3));
		if(strstr(row->GetField(2),"1"))
		{
			if(strstr(row->GetField(2),"T"))
				h1t[ind] = 1;
			else
				h1b[ind] = 1;
		}
	
		if(strstr(row->GetField(2),"2"))
		{
			if(strstr(row->GetField(2),"T"))
				h2t[ind] = 1;
			else
				h2b[ind] = 1;
		}
	
		if(strstr(row->GetField(2),"3"))
		{
			if(strstr(row->GetField(2),"T"))
				h3t[ind] = 1;
			else
				h3b[ind] = 1;
		}
	
		if(strstr(row->GetField(2),"4"))
		{
			if(strstr(row->GetField(2),"T"))
			{
				if(strstr(row->GetField(2),"u"))
					h4tu[ind] = 1;
				else
					h4td[ind] = 1;
			}
			else
			{
				if(strstr(row->GetField(2),"u"))
					h4bu[ind] = 1;
				else
					h4bd[ind] = 1;
			}
		}

	// *** Dimuon? ***
		TString ts = row->GetField(0);
		if(ts.IsNull())
			dimuon = 0;
		else
			dimuon = 1;
	}

	cout << "EVENT NUMBER " << ID << "\t\t" << "NUMBER OF HITS " << nentries << "\t\t" << "DIMUON? " << dimuon << endl;


// *** Save TTree ***
	t->Write();
}
