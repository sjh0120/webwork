var url=require('url');
var querystring=require('querystring');
var myUrl="https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=java&oquery=jaa&tqi=hor8Bdp0JXVssk5xjeVssssstPN-488059";
console.log(url.parse(myUrl));
console.log(url.parse(myUrl).pathname);
console.log(url.parse(myUrl).query);

var q=querystring.parse(url.parse(myUrl).query);
console.log(q.where, q.query);
console.log(querystring.stringify(q));