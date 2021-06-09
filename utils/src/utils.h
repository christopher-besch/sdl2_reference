#pragma once

#include <algorithm>
#include <filesystem>
#include <iostream>
#include <stdexcept>
#include <string>
#include <vector>

#ifdef LINUX
#define file_slash '/'
#endif
#ifdef WASM
#define file_slash '/'
#endif
#ifdef WINDOWS
#define file_slash '\\'
#endif

// load files from cwd or from execution location
// file slash at end has already been added if required
#ifdef IDE
inline std::string get_exec_dir(std::string execution_path)
{
    return "";
}
#else
// argv[0] can be used
// todo: doesn't work when loaded from PATH
inline std::string get_exec_dir(std::string execution_path)
{
    // cut at last slash
    for (int idx = execution_path.size() - 1; idx >= 0; idx--)
        if (execution_path[idx] == file_slash)
            return execution_path.substr(0, idx + 1);
    return "";
}
#endif

#ifdef DEBUG
#define raise_error(msg)                                                                                                  \
    {                                                                                                                     \
        std::cerr << msg << " (in: " << __FILE__ << ":" << __LINE__ << "; in function: " << __func__ << ")" << std::endl; \
        std::exit(EXIT_FAILURE);                                                                                          \
    }
#else
#define raise_error(msg)               \
    {                                  \
        std::cerr << msg << std::endl; \
        std::exit(EXIT_FAILURE);       \
    }
#endif

inline int checked_stoi(std::string str)
{
    try
    {
        return std::stoi(str);
    }
    catch (const std::invalid_argument& ex)
    {
        raise_error("Can't convert \"" << str << "\" to int!");
    }
}

inline void remove_chars(std::string& str, std::vector<char> chars)
{
    for (int idx = str.size() - 1; idx >= 0; idx--)
        if (std::find(chars.begin(), chars.end(), str[idx]) != chars.end())
            str.erase(idx, 1);
}

inline void make_lower_case(std::string& str)
{
    for (char& character : str)
        if (character >= 'A' && character <= 'Z')
            character += 'a' - 'A';
}

template <typename T, typename R>
inline bool contains(T list, R element)
{
    return std::find(list.begin(), list.end(), element) != list.end();
}

inline bool is_little_endian()
{
    // gets stored as 00000000 00000001 <- big endian
    // or 10000000 00000000 <- little endian
    uint16_t num = 1;
    // char* points to first byte
    return *reinterpret_cast<char*>(&num) == 1;
}

// swap order of bytes
inline int32_t swap(uint32_t num)
{
    int32_t result = num & 0xff;
    result         = (result << 8) | (num >> 8) & 0xff;
    result         = (result << 8) | (num >> 16) & 0xff;
    result         = (result << 8) | (num >> 24) & 0xff;
    return result;
}
