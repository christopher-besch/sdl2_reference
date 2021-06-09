#pragma once

#include <cmath>
#include <limits>

constexpr double infinity = std::numeric_limits<double>::infinity();
constexpr double pi       = 3.1415926535897932385;

inline double degrees_to_radians(double degrees)
{
    return degrees * pi / 180.0;
}

inline double clamp(double x, double min, double max)
{
    if (x < min) return min;
    if (x > max) return max;
    return x;
}
