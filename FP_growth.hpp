#ifndef FP_GROWTH_HPP
#define  FP_GROWTH_HPP

#include <unordered_map>

using namespace std;

struct TreeNode
{   
    TreeNode(int item) : item(item), count(0) {}
    TreeNode* findChild(int item);
    TreeNode* addChild(int item);
    TreeNode* addChild(TreeNode* child);
    TreeNode* removeChild(int item);
    size_t getChildrenCount() { return children.size(); }

    int item; // 這個節點代表的商品
    int count; // 這個節點被走訪的次數
    TreeNode* parent;
    unordered_map<int, TreeNode*> children; // key: 商品編號, value: 子節點
};

TreeNode* TreeNode::findChild(int item) {
    auto iter = children.find(item);
    if (iter != children.end())
        return iter->second;
    return nullptr;
}

TreeNode* TreeNode::addChild(int item) {
    TreeNode* child = new TreeNode(item);
    children.emplace(item, child);
    return child;
}

TreeNode* TreeNode::addChild(TreeNode* child) {
    children.emplace(child->item, child);
    return child;
}

TreeNode* TreeNode::removeChild(int item) {
    auto iter = children.find(item);
    if (iter != children.end())
        children.erase(iter);
    return this;
}

#endif