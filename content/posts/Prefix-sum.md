+++

title = "Algorithm | 前缀和"

date = 2024-06-04

description = "介绍前缀和相关知识"

short = true

tags=["Algorithm"]

series = ["Algorithm"]

+++

## 一维前缀和

对于数组 a，定义它的前缀和数组 s 为:

```python

s[0] = 0

s[1] = a[0] + a[1]

s[2] = a[0] + a[1] + a[2]

......

```

根据这个定义，有

```python

s[i+1] = s[i] + a[i]

```

通过前缀和，我们可以把**连续子数组的元素和转换成两个前缀和的差**  

`a[left]`到`a[right]` 的元素和等于`s[right+1]−s[left]`


为什么要定义 `s[0]=0`，这样做有什么好处？


如果 `left=0`，要计算的子数组是一个前缀，从 `a[0]` 到 `a[right]`，我们要用 `s[right+1]`减去 `s[0]`。如果不定义 `s[0]=0`，就必须特判 `left=0`的情况了。通过定义 `s[0]=0`，任意子数组（包括前缀）都可以表示为两个前缀和的差  

此外，如果 a 是空数组，定义 `s[0]=0` 的写法是可以兼容这种情况的


给出如下实现供参考：

```python

class NumArray:

    def __init__(self, nums: List[int]):

        self.pre = [0]

        for v in nums:

            self.pre.append(self.pre[-1] + v)

    def sumRange(self, left: int, right: int) -> int:

        return self.pre[right + 1] - self.pre[left]

```

## 前缀和的其他变化

这种思想不仅可以用来表示求和，乘积、异或等运算也可以使用


考虑这样一个问题：
>Given an integer array `nums`, return _an array_ `answer` _such that_ `answer[i]` _is equal to the product of all the elements of_ `nums` _except_ `nums[i]`.  
>The product of any prefix or suffix of `nums` is **guaranteed** to fit in a **32-bit** integer.
>You must write an algorithm that runs in `O(n)` time and without using the division operation.
>

	Example 1:

	Input: nums = [1,2,3,4]

	Output: [24,12,8,6]

	Example 2:

	Input: nums = [-1,1,0,-3,3]

	Output: [0,0,9,0,0]


要设计一个`O(n)`的算法，假设结果数组是`ans`，对于`ans[i]`的值，等于它左边所有数的乘积乘以右边所有数的乘积，故我们可以使用一个前缀乘积数组和后缀乘积数组来解决这个问题


给出如下解答供参考：

```python

class Solution:

    def productExceptSelf(self, nums: List[int]) -> List[int]:

        n = len(nums)

        pre = [1] * n

        for i in range(1, n):

            pre[i] = pre[i - 1] * nums[i - 1]

        suf = [1] * n

        for i in range(n - 2, -1, -1):

            suf[i] = suf[i + 1] * nums[i + 1]

        return [p * s for p, s in zip(pre, suf)]

```

## 二维前缀和

定义 `sum[i ＋ 1][j + 1]` 表示左上角为`a[0][0]`，右下角为 `a[i][j]`的子矩阵元素和  

根据这个定义，有：

```python

sum[i + 1][i + 1] = sum[i + 1][j] + sum[i][j + 1] - sum[i][j] + a[i][j]

```

采用这种定义方式，无需单独处理第一行或第一列的元素和


要计算任意子矩阵元素和时：

设子矩阵左上角为`a[r1][c1]`右下角为`a[r2-1][c2-1]`

```python

target_sum = sum[r2][c2] - sum[r2][c1] - sum[r1][c2] + sum[r1][c1]

```

与一维前缀和类似，二维前缀和主要用于解决`O(N)`复杂度下某一范围的快速求和


给出如下实现供参考：

```python

class NumMatrix:

    def __init__(self, matrix: List[List[int]]):

        m, n = len(matrix), len(matrix[0])

        s = [[0] * (n + 1) for _ in range(m + 1)]

        for i, row in enumerate(matrix):

            for j, x in enumerate(row):

                s[i + 1][j + 1] = s[i + 1][j] + s[i][j + 1] - s[i][j] + x

        self.s = s

    # 返回左上角在 (r1,c1) 右下角在 (r2,c2) 的子矩阵元素和

    def sumRegion(self, r1: int, c1: int, r2: int, c2: int) -> int:

        return self.s[r2 + 1][c2 + 1] - self.s[r2 + 1][c1] - self.s[r1][c2 + 1] + self.s[r1][c1]

```