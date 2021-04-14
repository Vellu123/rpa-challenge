import requests
from robot.api.deco import keyword


@keyword
def get_file(download_url):
    response = requests.get(download_url)
    with open('excel.xlsx', 'wb') as excel_file:
        excel_file.write(response.content)
