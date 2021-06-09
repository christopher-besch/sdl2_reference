#include "trie.h"

void Trie::insert(std::string key)
{
    // start at root node
    TrieNode *current_node = m_root;
    for (int idx = 0; idx < key.size(); idx++)
    {
        int char_idx = char_to_idx(key[idx]);
        // when not found
        if (!current_node->children[char_idx])
            current_node->children[char_idx] = new TrieNode;
        current_node = current_node->children[char_idx];
    }
    // last node is leaf
    current_node->end_of_word = true;
}

bool Trie::search(std::string key) const
{
    // start at root node
    TrieNode *current_node = m_root;
    for (int idx = 0; idx < key.size(); idx++)
    {
        int char_idx = char_to_idx(key[idx]);
        // when not found
        if (!current_node->children[char_idx])
            return false;
        current_node = current_node->children[char_idx];
    }
    // only when leaf
    return current_node->end_of_word;
}

// return amount of characters that can be matched to a word (starting at the first element)
int Trie::count_matching_chars(std::string key) const
{
    int count = 0;
    // start at root node
    TrieNode *current_node = m_root;
    for (int idx = 0; idx < key.size(); idx++)
    {
        int char_idx = char_to_idx(key[idx]);
        // when not found
        if (!current_node->children[char_idx])
            return count;
        current_node = current_node->children[char_idx];
        // when leaf
        if (current_node->end_of_word)
            count = idx + 1;
    }
    return count;
}
