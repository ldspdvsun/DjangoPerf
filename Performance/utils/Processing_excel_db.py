import random
import pandas as pd
from PerformanceTest.src.db.db_connector import MySQLConnector
from PerformanceTest.src.db.PerformanceTestResults import PerformanceTestResultsTable

DBHOST = 'localhost'
DBPORT = 3306
DBUSER = 'root'
DBPASS = 'S05141123l'
DBNAME = 'test'

# 示例连接数据库
connector = MySQLConnector(host=DBHOST, port=DBPORT, user=DBUSER, password=DBPASS, database=DBNAME)
connector.connect()

# 从Excel文件读取数据
excel_file = "E:\\PycharmProjects\\Company\\PerformanceTest\\file\\results\perf_result.xlsx"  # 请替换成你的 Excel 文件名
df = pd.read_excel(excel_file)

# 插入测试数据到数据库
for _, row in df.iterrows():
    data_dict = {
        'TestYear': int(row['test_time']),
        'TestBatch': int(row['test_batch']),
        'PerfTestManufacturerType': int(row['manufacturer_type']),
        'PerfTestManufacturerID': int(row['manufacturer_id']),
        'PerfTestPlatformID': int(row['platform_id']),
        'TestCaseID': int(row['test_case_id']),
        'TestResult': float(row['value']),
        'TestThreshold': 0.0,  # 你需要提供 TestThreshold 的值
        'PerfTestPersonID': int(row['person_id']),
        'LogFilePath': 'path/to/log1',  # 你需要提供 LogFilePath 的值
        'ImageFilePath': 'path/to/image1',  # 你需要提供 ImageFilePath 的值
        'KeywordResult': 'keyword_result1'  # 你需要提供 KeywordResult 的值
    }

    data_tuple = (
        data_dict['TestYear'],
        data_dict['TestBatch'],
        data_dict['PerfTestManufacturerType'],
        data_dict['PerfTestManufacturerID'],
        data_dict['PerfTestPlatformID'],
        data_dict['TestCaseID'],
        data_dict['TestResult'],
        data_dict['TestThreshold'],
        data_dict['PerfTestPersonID'],
        data_dict['LogFilePath'],
        data_dict['ImageFilePath'],
        data_dict['KeywordResult']
    )

    # 插入数据
    PerformanceTestResultsTable.insert(connector.cursor, data_tuple)

# 提交并关闭连接
connector.connection.commit()

# 查询并打印所有数据
result = PerformanceTestResultsTable.select_all(connector.cursor)
print("PerformanceTestResultsTable.select_all 查询结果:")
for row in result:
    print(row)

connector.disconnect()
