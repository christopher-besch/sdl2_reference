#pragma once

#include <random>

class RandomGen
{
private:
    std::random_device random_device;
    std::mt19937       random = std::mt19937(random_device());

public:
    // in [0, 1]
    double next_double()
    {
        uint64_t val = static_cast<uint64_t>(random()) | static_cast<uint64_t>(random()) << 32;
        return val / static_cast<double>(UINT64_MAX);
    }
    double next_double(double min, double max)
    {
        return min + (max - min) * next_double();
    }

    int next_int(int min, int max)
    {
        return next_double(min, max + 1);
    }
};
