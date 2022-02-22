from google.cloud import storage, bigquery
import os
from google.oauth2 import service_account

def implicit():
    from google.cloud import storage

    # If you don't specify credentials when constructing the client, the
    # client library will look for credentials in the environment.
    storage_client = storage.Client()

    # Make an authenticated API request
    buckets = list(storage_client.list_buckets())
    print(buckets)
def download_data():
    bqclient = bigquery.Client()
    credentials = service_account.Credentials.from_service_account_file("mimiciv-340315-eaf5a35f59e8.json")
    # Project ID 
    project_id = 'mimiciv-340315' 
    # Configure a BigQuery client to use your credentials and project. Instantiates a client for BigQuer Service.
    bigquery_client = bigquery.Client(credentials=credentials, project=project_id)

    # Download query results.
    query_string = """
    SELECT
    CONCAT(
        'https://stackoverflow.com/questions/',
        CAST(id as STRING)) as url,
    view_count
    FROM `bigquery-public-data.stackoverflow.posts_questions`
    WHERE tags like '%google-bigquery%'
    ORDER BY view_count DESC
    """

    query_str = """
    SELECT DISTINCT  dicd.subject_id, dig.long_title 
    FROM `physionet-data.mimic_hosp.diagnoses_icd` dicd
    JOIN `physionet-data.mimic_hosp.d_icd_diagnoses` dig ON
    dig.icd_code = dicd.icd_code 
    WHERE dig.long_title LIKE '%without chronic kidney%'"""
    df = bigquery_client.query(query_str).to_dataframe() 
    df.to_csv("extracted_data.csv", index=False,header=True)
    print("csv file generated")
    # dataframe = (
    #     bqclient.query(query_str)
    #     .result()
    #     .to_dataframe(
    #         # Optionally, explicitly request to use the BigQuery Storage API. As of
    #         # google-cloud-bigquery version 1.26.0 and above, the BigQuery Storage
    #         # API is used by default.
    #         create_bqstorage_client=True,
    #     )
    # )
    # print(dataframe.head())
if __name__=="__main__":
    #implicit()
    download_data()