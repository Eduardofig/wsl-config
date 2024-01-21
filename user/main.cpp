// 今日は昨日の自分に対する勝利です。明日はあなたが格下の者たちに勝利するのです。戦士は、
// 他の人よりも立ち上がって嵐の中で強く立たなければ価値がありません。侍は常に立ち上がり、
// 前進しなければなりません。新たな課題が訪れるからです。

#include <bits/stdc++.h>

#define For(i, n) for(int (i) = 0; (i) < (int)(n); ++(i))
#define Foro(i, n) for(int (i) = 1; (i) < (int)(n); ++(i))
#define Forr(i, n) for(int (i) = (int)(n) - 1; (i) >= 0; --(i))
#define Fore(v, ...) for(auto &[__VA_ARGS__]: (v))
#define All(x) (x).begin(), (x).end()
#define Mini(x, y) (x) = min((x), (y))
#define Maxi(x, y) (x) = max((x), (y))
#define Read(x) generate(All((x)), nxt)
#define Pr(x) cout << (x) << ' '
#define Prn(x) cout << (x) << '\n'
#define Has(x, y) ((x).find((y)) != (x).end())

// #define int ll
 
using namespace std;
 
using ll = long long;
using ull = unsigned long long;
using ii = pair<int, int>;
using vi = vector<int>;
using vll = vector<ll>;
using vvi = vector<vi>;
using vii = vector<ii>;
using vb = vector<bool>;
using vvb = vector<vb>;
 
const int MXN = 5e5 + 100;
const int INF = INT_MAX;

const bool MULTIPLE_TESTCASES = 1;

ll nxt() {
    ll x;
    cin >> x;
    return x;
}

void solve() {
    
}

void read() {
    
}

int32_t main() {
    ios_base::sync_with_stdio(false);
    cin.tie(nullptr);
    cout.tie(nullptr);

    if(MULTIPLE_TESTCASES) {
        int t;
        cin >> t;
        while(t--) {
            read();
            solve();
        }
    } else {
        read();
        solve();
    }
}
