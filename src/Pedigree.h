#ifndef Pedigree_h
#define Pedigree_h
#include <iostream>
#include <fstream>
#include <iomanip>
#include <string>
#include <map>
#include <vector>
#include <iterator>
using namespace std;

class iNode;
class Mij;
class pedigree;

class iNode
{
 public:
  int ind,dam,sire;
  int iNum,gen;
  double f;
  bool getA;
  iNode(const int i,const int d,const int s);
};


class Mij
{
 public:
  unsigned i,j;
  bool operator<(const Mij y)const
  {
    if(i<y.i){return 1;}
    if(i>y.i){return 0;}
    else
      {
	if(j<y.j){return 1;}
	else return 0;
      }
  }
};

class pedigree : public vector<iNode*>
{
 private:
  unsigned COUNT;
  map<const Mij,double> C;
  map<const Mij,double> A,Ainv;
  void code(iNode *pInd);
 public:
  void codePedigree();
  void trimPedigree();
  void makeAinv();
  void makeA();
  void writeAinv(string aFile);
  void writeA(string aFile);
  double getRij(const int dam,const int sire);
};

#endif
