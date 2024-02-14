# coding=utf-8
"""
@File    : ProcessingLogDb.py
@Time    : 2024/1/23 13:30
@Author  : Sun
@Description : 
"""

import os
import re
import pandas as pd
from django.core.files.storage import default_storage

class ProcessLog:
    def __init__(self, file_path, key_word):
        self.file_path = file_path
        self.key_word = key_word

    def extract_file_info(file_name):
        # 使用正则表达式从文件名中提取信息
        pattern = r'(\d+)_(\d+)_(\d+)_(\d+)_(\d+)_(\d+)_(\d+)\.log'
        match = re.match(pattern, file_name)

        if match:
            return {
                'test_time': match.group(1),
                'test_batch': match.group(2),
                'manufacturer_type': match.group(3),
                'manufacturer_id': match.group(4),
                'platform_id': match.group(5),
                'test_case_id': match.group(6),
                'person_id': match.group(7)
            }
        else:
            return None

    # def find_key_values(file_path, key_word):
    #     with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
    #         content = f.read()
    #
    #     # 使用正则表达式查找数字+单位（ms 或 ns）
    #     pattern = r'(\d+\.\d+)(key_word)'
    #     matches = re.findall(pattern, content)
    #
    #     return [{'value': match[0], 'unit': match[1]} for match in matches]

    @staticmethod
    def find_key_values(file_path, key_word):
        with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()

        # 使用正则表达式查找数字+单位（ms 或 ns）
        # pattern = rf'(\d+\.\d+){key_word}'
        pattern = r'(\d+\.\d+)({})'.format(key_word)


        matches = re.findall(pattern, content)

        return [{'value': match[0], 'unit': key_word} for match in matches]

    def main(folder_path, output_excel):
        # 获取文件夹下所有文件
        all_files = [f for f in os.listdir(folder_path) if os.path.isfile(os.path.join(folder_path, f))]

        # 分析并保存数据
        result_data = []
        total_matched_values = 0
        for file_name in all_files:
            file_path = os.path.join(folder_path, file_name)

            # 提取文件名中的信息
            file_info = extract_file_info(file_name)

            if file_info:
                processed_data = find_key_values(file_path)

                if processed_data:
                    # 合并文件信息和匹配的数据
                    for entry in processed_data:
                        entry.update(file_info)
                    result_data.extend(processed_data)
                    total_matched_values += len(processed_data)

        # 将数据保存到Excel
        df = pd.DataFrame(result_data,
                          columns=['test_time', 'test_batch', 'manufacturer_type', 'manufacturer_id', 'platform_id',
                                   'test_case_id', 'person_id', 'value', 'unit'])
        df.to_excel(output_excel, index=False)
        print(f"Data saved to {output_excel}")

        # 打印匹配值的数量
        print(f"Total matched values: {total_matched_values}")


if __name__ == "__main__":
    folder_path = "E:\\PycharmProjects\\Company\\PerformanceTest\\file\\los"  # 替换成你的文件夹路径
    output_excel = "E:\\PycharmProjects\\Company\\PerformanceTest\\file\\results\perf_result.xlsx"  # 输出Excel文件名

    main(folder_path, output_excel)
