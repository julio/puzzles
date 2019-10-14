class Stack():
    def __init__(self):
        self.main_stack = []
        self.max_stack = []

    def push(self, val):
        if not self.main_stack:
            self.main_stack.append(val)
            self.max_stack.append(val)
            return

        self.main_stack.append(val)
        if val > self.max_stack[-1]:
            self.max_stack.append(val)
        else:
            self.max_stack.append(self.max_stack[-1])

    def pop(self):
        val = self.main_stack[-1]
        del self.main_stack[-1]
        del self.max_stack[-1]
        return val

    def max(self):
        return self.max_stack[-1]


stack = Stack()
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)
stack.push(3)
stack.push(2)
stack.push(1)

print(stack.main_stack)
print(stack.max_stack)
print(stack.max())

stack.pop()
stack.pop()
stack.pop()
stack.pop()
stack.pop()

print(stack.main_stack)
print(stack.max_stack)
print(stack.max())

s = Stack()
s.push(1)
s.push(2)
s.push(3)
s.push(2)
print(s.max())
# 3
s.pop()
s.pop()
print(s.max())

