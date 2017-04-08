# ETAMock

## 1. Add the following to Test > Build phases > run script
# ============================
 
 
OUTPUT_FILE="./${PROJECT_NAME}Tests/GeneratedMocks.swift"
echo "Generated Mocks File = ${OUTPUT_FILE}"

INPUT_DIR="./${PROJECT_NAME}"
echo "Mocks Input Directory = ${INPUT_DIR}"

${PODS_ROOT}/Cuckoo/run generate --testable "${PROJECT_NAME}" \
--output "${OUTPUT_FILE}" \
"${INPUT_DIR}/JSONFetcher.swift"
 
 
 # ============================






## 2. Cofiguration examples:

![1](https://github.com/dfreemanRIIS/ETAMock/blob/master/Screen%20Shot%202017-03-28%20at%203.45.03%20PM.png)
![2](https://github.com/dfreemanRIIS/ETAMock/blob/master/Screen%20Shot%202017-03-28%20at%203.45.37%20PM.png)
![3](https://github.com/dfreemanRIIS/ETAMock/blob/master/Screen%20Shot%202017-04-06%20at%2010.29.22%20AM.png)
![4](https://github.com/dfreemanRIIS/ETAMock/blob/master/Screen%20Shot%202017-04-06%20at%208.45.55%20AM.png)

## 3. Use Newman to run Postman form the commandline and Jenkins
https://www.npmjs.com/package/newman
