#include <stdio.h>

int buffer[1025], dist[32];

void bellman_ford(int n, int * graph);

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

    // Bellman-Ford
    bellman_ford(n, graph);

    // Output
    for (int i = 1; i < n; i++)
    {
        printf("%d ", dist[i]);
    }

    return 0;
}

void bellman_ford(int n, int * graph)
{
    // Initialization
    dist[0] = 0;
    for (int i = 1; i < n; i++)
    {
        dist[i] = -1;
    }

    // Relaxation for (n - 1) times
    for (int i = 1; i < n; i++)
    {
        // Relaxation on every edge each time
        for (int u = 0; u < n; u++)
        {
            for (int v = 0; v < n; v++)
            {
                int addr = (u << 5) + v;
                if (dist[u] == -1 || graph[addr] == -1) continue;
                if (dist[v] == -1 || dist[v] > dist[u] + graph[addr])
                {
                    dist[v] = dist[u] + graph[addr];
                }
            }
        }
    }
}