import json
import pandas as pd


def get_icds(file_path):
    selected_icds = []
    with open(file_path, 'r') as j:
        data = json.loads(j.read())
        for row in data:
            if(int(row['count']) > 1000):
                selected_icds.append(row['icd_code'])
    return selected_icds

def get_rowCounts(file_path):
    df = pd.read_csv(file_path)
    print(df.head(10))
    return df.shape

if __name__ == "__main__":
    data = None
    # with open('results-20220218-162426.json', 'r') as j:
    #     data = json.loads(j.read())
    #df = pd.read_csv('bq-results-20220218-153158-cl74v08k7enx.csv')
    #print(df.shape[0], df.shape[1])
    # features = []
    # for row in data:
    #     if(int(row['count']) > 1000):
    #         features.append(row['label'])
        
    # print(features)
    # print(len(features))
    #print(get_icds('ICD-code-subject-count.json'))
    print(get_rowCounts('../../Downloads/bq-results-20220218-172030-wmt74bsztg7y/bq-results-20220218-172030-wmt74bsztg7y.csv'))


