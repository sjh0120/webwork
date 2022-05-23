var url=require('url');
var myUrl="https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=java&oquery=jaa&tqi=hor8Bdp0JXVssk5xjeVssssstPN-488059";
var myUrl=new url.URL(myUrl);
// console.log(myUrl.origin);
// console.log(myUrl.pathname);
// console.log(myUrl.searchParams);
// console.log(myUrl.searchParams.get('query'));
// console.log(myUrl.searchParams.get('where'));
// console.log(myUrl.searchParams.keys());

// for(var key of myUrl.searchParams.keys())
//     console.log(key, myUrl.searchParams.get(key));

for(var key of myUrl.searchParams.values())
    console.log(key);