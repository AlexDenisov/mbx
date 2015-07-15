extern int printf(const char *fmt, ...);
extern int calc(float);

int main() {
  printf("%d\n", calc(2.f));
  return 0;
}
