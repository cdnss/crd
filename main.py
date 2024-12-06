from bs4 import BeautifulSoup
from flask import *
import os
app = Flask(__name__)
ports = os.getenv("PORT", 8080 )


# pip3 install seleniumbase
from seleniumbase import Driver

target = "https://doujindesu.tv"

def get(url):
# initialize the driver in GUI mode with UC enabled
  driver = Driver(uc=True, headless=False)

# set the target URL

# open URL using UC mode with 6 second reconnect time to bypass initial detection
  driver.uc_open_with_reconnect(url, reconnect_time=1)

# attempt to click the CAPTCHA checkbox if present
  driver.uc_gui_click_captcha()
  soup = BeautifulSoup(driver.page_source, "html.parser")

  for dd in soup.select("script:-soup-contains('mydomain')"):
    dd.decompose()
  return str(soup)
# take a screenshot of the current page and save it
  driver.quit()


@app.route("/")
def hello():
    return get(target)

@app.route("/<path:all>" , strict_slashes=False, methods=['POST', 'GET'])
def post(all):
    url2 = request.full_path

    return get(target+url2)






if __name__ == "__main__":
    app.run(host="0.0.0.0", port=ports, debug=True)





"""

from selenium import webdriver
from selenium_stealth import stealth
from bs4 import BeautifulSoup
from flask import *
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import os
app = Flask(__name__)
ports = os.getenv("PORT", 5000)



target = "https://doujindesu.tv"


def crot(all):
   options = webdriver.ChromeOptions()
   options.add_argument("--headless")
   options.add_experimental_option("excludeSwitches", ["enable-automation"])
   options.add_experimental_option('useAutomationExtension', False)
   options.add_argument("start-maximized")
   options.add_argument("disable-infobars")
   options.add_argument("--user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36");


   options.add_argument("--disable-extensions")
   options.add_argument("--disable-gpu")
   options.add_argument("--disable-dev-shm-usage")
   options.add_argument("--no-sandbox")
   options.add_argument( '--disable-blink-features=AutomationControlled' )
   driver = webdriver.Chrome(options=options)


   stealth(driver,
           languages=["en-US", "en"],
           vendor="Google Inc.",
           platform="Win32",
           webgl_vendor="Intel Inc.",
           renderer="Intel Iris OpenGL Engine",
           fix_hairline=True,
           )



   driver.get(all)
   
   wait = WebDriverWait(driver, 10)

# Wait for the document to be fully loaded
   wait.until(lambda driver: driver.execute_script("return document.readyState;") == "complete")

#print(driver.page_source)
   soup = BeautifulSoup(driver.page_source, "html.parser")

   for dd in soup.select("script:-soup-contains('mydomain')"):
     dd.decompose()

   div = soup
   """
   if soup.find_all("div", {"id": "anu"}):
     div = soup.find_all("div", {"id": "anu"})
   else:
     div = "hmm"
   """
   driver.close()
   return str( div )
@app.route("/")
def ok():
   
   return crot(target)

@app.route("/<path:all>" , strict_slashes=False, methods=['POST', 'GET'])
def ull(all):
   url = request.full_path
   return crot(target+url)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=ports, debug=True)
"""
