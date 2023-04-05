#include <stdio.h>

int buffer[1025], dist[32], visited[32];

void dfs_sssp(int n, int * graph);
void dfs(int n, int * graph, int u, int cur_dist);

int main()
{
    FILE * f;
    int n;

    // Input
    f = fopen("./test.dat", "rb");
    fread(buffer, sizeof(buffer), 1, f);
    fclose(f);
    n = buffer[0];
    int * graph = (int *)(buffer + 1);

    // DFS
    dfs_sssp(n, graph);

    // Output
    for (int i = 1; i < n; i++)
    {
        printf("%d ", dist[i]);
    }

    return 0;
}

void dfs_sssp(int n, int * graph)
{
    // Initialization
    dist[0] = 0;
    visited[0] = 0;
    for (int i = 1; i < n; i++)
    {
        dist[i] = -1;
        visited[i] = 0;
    }

    // Start recursion
    dfs(n, graph, 0, 0);
}

void dfs(int n, int * graph, int u, int cur_dist)
{
    // Update
    visited[u] = 1;
    if (dist[u] == -1 || dist[u] > cur_dist)
    {
        dist[u] = cur_dist;
    }

    // Traverse every unvisited neighbor
    for (int v = 0; v < n; v++)
    {
        if (visited[v] != 0) continue;
        int addr = (u << 5) + v;
        if (graph[addr] == -1) continue;
        dfs(n, graph, v, cur_dist + graph[addr]);
    }

    // Restore
    visited[u] = 0;
}