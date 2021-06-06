# Tests operations on binary numbers.
# CSC 225, Assignment 1
# Given tests, Winter '20

import unittest
import binary as bn


class TestBinary(unittest.TestCase):
    def test_01_add(self):
        msg = "Testing basic binary addition"
        self.assertEqual(bn.add("00000011", "00000010"), "00000101", msg)

    def test_02_add(self):
        msg = "Testing basic binary addition"
        self.assertEqual(bn.add("00110011", "00000010"), "00110101", msg)

    def test_03_add(self):
        msg = "Testing basic binary addition"
        self.assertEqual(bn.add("11110011", "10000010"), "01110101", msg)

    def test_01_negate(self):
        msg = "Testing basic binary negation"
        self.assertEqual(bn.negate("00000101"), "11111011", msg)

    def test_02_negate(self):
        msg = "Testing basic binary negation"
        self.assertEqual(bn.negate("10010110"), "01101010", msg)

    def test_03_negate(self):
        msg = "Testing basic binary negation"
        self.assertEqual(bn.negate("11010110"), "00101010", msg)

    def test_01_subtract(self):
        msg = "Testing basic binary subtraction"
        self.assertEqual(bn.subtract("00000011", "00000010"), "00000001", msg)

    def test_02_subtract(self):
        msg = "Testing basic binary subtraction"
        self.assertEqual(bn.subtract("11101011", "11001100"), "00011111", msg)

    def test_03_subtract(self):
        msg = "Testing basic binary subtraction"
        self.assertEqual(bn.subtract("11001010", "10010100"), "00110110", msg)

    def test04_binary_to_decimal(self):
        msg = "Testing basic binary-to-decimal conversion"
        self.assertEqual(bn.binary_to_decimal("00000101"), 5, msg)

    def test05_decimal_to_binary(self):
        msg = "Testing basic decimal-to-binary conversion"
        self.assertEqual(bn.decimal_to_binary(5), "00000101", msg)


if __name__ == "__main__":
    unittest.main()
