let t = [];
for (let i = 0; i < 1000; i += 1) {
  t.push(100792);
}
while (true) {
  t.push(t.shift());
}
