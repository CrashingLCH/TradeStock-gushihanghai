/**
 * 
 */
function hd() {
	document.getElementById('hudong').style.display = 'block';
	document.getElementById('cnt-hd').style.display = 'block';
	document.getElementById('liaotian').style.display = 'none';
	document.getElementById('xiaoxi').style.display = 'none';
}
function lt() {
	document.getElementById('hudong').style.display = 'none';
	document.getElementById('xiaoxi').style.display = 'none';
	document.getElementById('liaotian').style.display = 'block';
	document.getElementById('cnt-lt').style.display = 'block';
}
function cntpl() {
	document.getElementById('cnt-ql').style.display = 'none';
	document.getElementById('cnt-tz').style.display = 'none';
	document.getElementById('cnt-dz').style.display = 'none';
	document.getElementById('cnt-xx').style.display = 'none';
	document.getElementById('cnt-pl').style.display = 'block';
	document.getElementById('cnt-hy').style.display = 'none';
}
function cntxx() {
	document.getElementById('cnt-ql').style.display = 'none';
	document.getElementById('cnt-tz').style.display = 'none';
	document.getElementById('cnt-dz').style.display = 'none';
	document.getElementById('cnt-xx').style.display = 'block';
	document.getElementById('cnt-pl').style.display = 'none';
	document.getElementById('cnt-hy').style.display = 'none';
}
function cntdz() {
	document.getElementById('cnt-ql').style.display = 'none';
	document.getElementById('cnt-tz').style.display = 'none';
	document.getElementById('cnt-dz').style.display = 'block';
	document.getElementById('cnt-xx').style.display = 'none';
	document.getElementById('cnt-pl').style.display = 'none';
	document.getElementById('cnt-hy').style.display = 'none';
}
function cnttz() {
	document.getElementById('cnt-ql').style.display = 'none';
	document.getElementById('cnt-tz').style.display = 'block';
	document.getElementById('cnt-dz').style.display = 'none';
	document.getElementById('cnt-xx').style.display = 'none';
	document.getElementById('cnt-pl').style.display = 'none';
	document.getElementById('cnt-hy').style.display = 'none';
}
function cntql() {
	document.getElementById('cnt-ql').style.display = 'block';
	document.getElementById('cnt-tz').style.display = 'none';
	document.getElementById('cnt-dz').style.display = 'none';
	document.getElementById('cnt-xx').style.display = 'none';
	document.getElementById('cnt-pl').style.display = 'none';
	document.getElementById('cnt-hy').style.display = 'none';
}
function cnthy() {
	document.getElementById('cnt-hy').style.display = 'block';
	document.getElementById('cnt-ql').style.display = 'none';
	document.getElementById('cnt-tz').style.display = 'none';
	document.getElementById('cnt-dz').style.display = 'none';
	document.getElementById('cnt-xx').style.display = 'none';
	document.getElementById('cnt-pl').style.display = 'none';
}