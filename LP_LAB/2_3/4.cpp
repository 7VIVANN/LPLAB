#include<bits/stdc++.h>
using namespace std;

map<char,set<char> >first;
map<char,set<char> >follow;
map<char,vector<string> >pd;
vector<char> ter;

set<char> :: iterator it4;

void comp_first(char s,vector<char> ter)
{
	for(int i=0;i<pd[s].size();i++)
	{
			for(int j=0;j<pd[s][i].length();j++)
			{
				if(find(ter.begin(),ter.end(),pd[s][i][j])!=ter.end())
				{
					first[s].insert(pd[s][i][j]);
					break;	
				}
			 	int f=0;
				if(pd[s][i][j]!=s)
				{
				//	cout<<pd[s][i][j]<<" ";
				comp_first(pd[s][i][j],ter);
				for(it4=first[pd[s][i][j]].begin();it4!=first[pd[s][i][j]].end();it4++)
				{
				char c=*it4;
				if(c=='#')
				{
				f=1;
				}
				first[s].insert(c);	
				}
				if(f==0)
				break;
				}
				else
				break;
			}		
	}	
}

void sfirst(string s,set<char>&fset)
{
	int i,f=0;
	for(i=0;i<s.length();i++)
	{
		if(find(ter.begin(),ter.end(),s[i])!=ter.end())
		{
			fset.insert(s[i]);
			break;
		}
		f=0;
		for(it4=first[s[i]].begin();it4!=first[s[i]].end();it4++)
		{
			if(*it4=='#')
			{
				f=1;
			}
			else
			fset.insert(*it4);
		}
		if(f==0)
		break;	
		
	}
	if(i==s.length())
	fset.insert('#');
}

void compute_follow(char c,vector<char> ter)
{
	map<char,vector<string> > :: iterator it2;
		for(it2=pd.begin();it2!=pd.end();it2++)
		{
				for(int i=0;i<it2->second.size();i++)
				{
					for(int j=0;j<it2->second[i].size();j++)
					{
						if(it2->second[i][j]==c)
						{
							if(j+1<it2->second[i].size()
									&&find(ter.begin(),ter.end(),it2->second[i][j+1])!=ter.end())
							{
								follow[c].insert(it2->second[i][j+1]);
								break;
							}
							else if(j+1==it2->second[i].size() && c!=it2->first)
							{
								if(follow[it2->first].size()==0)
								compute_follow(it2->first,ter);
								for(it4=follow[it2->first].begin();it4!=follow[it2->first].end();it4++)
								{
								//	cout<<"last letter ";
									follow[c].insert(*it4);
								}
							}
							else
							{
								int f;
								f=0;
							//	cout<<"finding first of B and adding to follow";
								string s=it2->second[i].substr(j+1);
								set<char> fset;
								sfirst(s,fset);
								for(it4=fset.begin();it4!=fset.end();it4++)
								{
									if(*it4=='#')
									f=1;
									else
									follow[c].insert(*it4);
								}
								if(f==1)
								{
									if(follow[it2->first].size()==0)
									compute_follow(it2->first,ter);
									it4=follow[it2->first].begin();
									for(;it4!=follow[it2->first].end();it4++)
									{
									follow[c].insert(*it4);
									}
								}
							}
							break;
						}
					}
				}
		}
}

void print(stack <char> s)
{
    while (!s.empty())
    {
        cout<<s.top();
        s.pop();
    }
    cout << '\t';
}


int main()
{
	int t;
	cout<<"enter no of terminals :";
	cin>>t;
	cout<<"enter terminals :";
	for(int i=0;i<t;i++)
	{
		char a;
		cin>>a;
		ter.push_back(a);
	}
	ter.push_back('#');
	int npd;
	cout<<"enter no of productions :";
	cin>>npd;
	cout<<"enter productions \n";
	char lp;
	string rp;
	vector<char> nt;
	for(int i=0;i<npd;i++)
	{
		cin>>lp>>rp;
		pd[lp].push_back(rp);
		nt.push_back(lp);
		for(int j=0;j<rp.length();j++)
		{
			if(find(ter.begin(),ter.end(),rp[j])==ter.end())
			nt.push_back(rp[j]);
		}
	}
	char startsym;
	cout<<"enter the start symbol :";
	cin>>startsym;
	
	map<char,vector<string> > :: iterator it;
	for(it=pd.begin();it!=pd.end();it++)
	{
		if(first[it->first].size()==0)
		comp_first(it->first,ter);
	}
	
	map<char,set<char> > :: iterator it1;
	for(it1=first.begin();it1!=first.end();it1++)
	{
		cout<<"first of "<<it1->first<<" { ";
		for(it4=first[it1->first].begin();it4!=first[it1->first].end();it4++)
		{
			cout<<*it4<<",";
		}
		cout<<" } \n";
	}
	
	follow[startsym].insert('$');
	for(it=pd.begin();it!=pd.end();it++)
	{
		compute_follow(it->first,ter);
	}

	for(it1=follow.begin();it1!=follow.end();it1++)
	{
		cout<<"follow of "<<it1->first<<" { ";
		for(it4=follow[it1->first].begin();it4!=follow[it1->first].end();it4++)
		{
			cout<<*it4<<",";
		}
		cout<<" } \n";
	}
	
	map<pair<char,char>,string> pptable;
	set<char> fset;
	pair<char,char> p;
	int f=0;
	for(it=pd.begin();it!=pd.end();it++)
	{
		for(int i=0;i<it->second.size();i++)
		{
			f=0;
			string s=it->second[i];
			fset.clear();
			sfirst(s,fset);
			string str="";
			str+=it->first;
			str+=" -> ";
			str+=s;
			for(it4=fset.begin();it4!=fset.end();it4++)
			{
				if(*it4=='#')
				f=1;
				else
				{
				p.first=it->first;
				p.second=*it4;
				pptable[p]=str;
				}
			}
			if(f==1)
			{
				for(it4=follow[it->first].begin();it4!=follow[it->first].end();it4++)
				{
					p.first=it->first;
					p.second=*it4;
					pptable[p]=str;
				}
			}
		}
	}
	
	map<pair<char,char>,string> :: iterator it5;
	
/*	cout<<"nonter- \n minal\t \t Input Symbol\n";
	cout<<"\t \t \t";
	for(int i=0;i<ter.size();i++)
	{
		if(ter[i]=='#')
		cout<<'$'<<"\t";
		else
		cout<<ter[i]<<"\t\t";
	}*/
	for(it5=pptable.begin();it5!=pptable.end();it5++)
	{
	     cout<<it5->first.first<<" on input "<<it5->first.second<<" ::  "<<it5->second<<endl;	
	}
	
	string input;
	cout<<"enter input string :";
	cin>>input;
	stack<char> st;
	st.push('$');
	st.push(startsym);
	int i;
	for(i=0;i<input.length();)
	{
		p.first=st.top();
		p.second=input[i];
		if(p.first==p.second)
		{
			st.pop();
			i++;
		}
		else 
		{
			st.pop();
			if(pptable[p].length()==0)
			break;
			cout<<pptable[p]<<endl;
			for(int j=pptable[p].length()-1;j>=5;j--)
			{
				if(pptable[p][j]!='#')
				st.push(pptable[p][j]);
			}
		}
		print(st);
		cout<<input.substr(i)<<endl;
	}
	if(i==input.length())
	cout<<"accepted\n";
	else
	cout<<"not accepted\n";
	return 0;
	
}

/*

E TX
X +TX
X #
T FY
Y *FY
Y #
F (E)
F a



+
*
(
)
a


*/

