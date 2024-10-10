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
#define Whatis(x) cout << #x << " is " << x << '\n'

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

int n, m, q;

vi b;
vi qu;

void solve() {
    sort(All(b));

    vi l(n), r(n);

    for(int &x: b) x--;

    int j = 0;
    int le = -1;
    for(int i = 0; i < n; ++i) {
        if(j < m && b[j] == i) {
            le = i;
        }
        l[i] = le;
    }

    int ri = n;
    j = m - 1;
    for(int i = n - 1; i >= 0; --i) {
        if(j >= 0 && b[j] == i) {
            ri = i;
        }

        r[i] = ri;
    }

    for(int i: qu) {
        if(i == l[i] || i == r[i]) {
            Prn(0);
            continue;
        }

        int sz = r[i] - l[i] - 1;
        Prn((sz + 1) / 2);
    }
}

void read() {
    cin >> n >> m >> q;

    qu.resize(q);
    b.resize(m);


    Read(b);
    Read(qu);
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
