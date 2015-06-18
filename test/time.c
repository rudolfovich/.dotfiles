#include <stdint.h>
#include <stdio.h>
#include <time.h>
#include <sys/time.h>

#define VALUE_TO_STRING(x) #x
#define VALUE(x) VALUE_TO_STRING(x)
#define VAR_NAME_VALUE(var) #var "="  VALUE(var)

#define PRINT_SIZE(type) \
  printf(\
    "sizeof(" VALUE_TO_STRING(type) ") == %d\n", \
    sizeof(type)\
  );


#ifndef CLOCK_MONOTONIC_RAW
#define CLOCK_MONOTONIC_RAW CLOCK_MONOTONIC
#endif

#define MICROSECONDS_IN_SECOND   (1e+6)
#define NANOSECONDS_IN_SECOND    (1e+9)
#define MICROSECONDS_IN_SECOND_INVERT  (1.0f / MICROSECONDS_IN_SECOND)

#define NANO_TO_MICRO(nano) (uint64_t)(nano * 0.001)

uint32_t
pk_time32_useconds()
{
  struct timeval tv;
  gettimeofday(&tv, NULL);
  return (uint32_t)(tv.tv_sec * MICROSECONDS_IN_SECOND) + tv.tv_usec;
}

uint64_t
pk_time64_useconds()
{
  struct timespec ts;
  if (clock_gettime(CLOCK_MONOTONIC_RAW, &ts)) {
    // error!
    return 0;
  }
  return (uint64_t)(ts.tv_sec * MICROSECONDS_IN_SECOND) + (uint64_t)(ts.tv_nsec * 0.001);
}

typedef uint64_t testtime_t;


testtime_t tv2usec(const struct timeval *tv)
{
  return (testtime_t)(tv->tv_usec) + (testtime_t)(tv->tv_sec * MICROSECONDS_IN_SECOND);
}

void test1()
{
  testtime_t i, j;
  struct timeval tv_now, tv_last;
  testtime_t unow, ulast, udelta;

#define SIZEOF_BIT(type)            (sizeof(type) * 4)
#define SIZEOF_BIT_MINUS_ONE(type)  (SIZEOF_BIT(type) - 1)
#define MAXINT(type)                ((1 << SIZEOF_BIT_MINUS_ONE(type)) + ((1 << SIZEOF_BIT_MINUS_ONE(type)) - 1))

  printf("MAXINT(tv_now.tv_sec): %lu\n", MAXINT(tv_now.tv_sec));

  tv_now.tv_sec = MAXINT(tv_now.tv_sec) - 100;
  tv_now.tv_usec = 0;
  tv_last = tv_now;

  unow = tv2usec(&tv_now);
  ulast = unow - 1;
  udelta = 0;

  printf("START: udelta != 1: udelta: %u, unow: %u, ulast: %u i: %u, j: %u\n",
         udelta, unow, ulast,
         i, j);

  for (i=0; i < 255; i++)
  {
    tv_now.tv_sec++;
    tv_now.tv_usec = 0;

    for (j=0; j < MICROSECONDS_IN_SECOND; j++)
    {
      tv_now.tv_usec++;

      unow = tv2usec(&tv_now);

      udelta = unow - ulast;

      if (udelta != 1) {
        printf("udelta != 1: udelta: %u, unow: %u, "
               "ulast: %u "
               "i: %u, j: %u "
               "tv_now: %u.%u "
               "tv_last: %u.%u\n",
               udelta, unow,
               ulast,
               i, j,
               tv_now.tv_sec, tv_now.tv_usec,
               tv_last.tv_sec, tv_last.tv_usec
               );
      }

      ulast = unow;
      tv_last = tv_now;
    }
  }
}


//void test2()
//{
//  struct timeval tv;
//  int sizeof_time = sizeof(tv.tv_usec) * 8;
//  int64_t limit = (1 << sizeof_time) - 1;

//  printf("sizeof_time == %d\n", sizeof_time);

//  for (uint64_t i=0; i<limit; i++)
//  {

//  }
//}

int main(int argc, char **argv) {
  struct timeval tv;
  struct timespec ts;

  printf("Program %s\n", argv[0]);

  PRINT_SIZE(tv);
  PRINT_SIZE(tv.tv_sec);
  PRINT_SIZE(tv.tv_usec);
  PRINT_SIZE(struct timeval);

  PRINT_SIZE(struct timespec);
  PRINT_SIZE(ts);
  PRINT_SIZE(ts.tv_sec);
  PRINT_SIZE(ts.tv_nsec);

  test1();

  return 0;
}


