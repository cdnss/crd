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
