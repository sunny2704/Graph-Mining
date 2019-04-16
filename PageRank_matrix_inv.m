function PageRank_matrix_inv
%implementation of pagerank using matrix inverse
dbstop if error; clear; clc; close all;

df = 0.85;

adj_mat = [
1 1 1 1 1 1 1 1 1 1 1; % node 1
0 0 1 0 0 0 0 0 0 0 0; % node 2
0 1 0 0 0 0 0 0 0 0 0; % node 3
1 1 0 0 0 0 0 0 0 0 0; % node 4
0 1 0 1 0 1 0 0 0 0 0; % node 5
0 1 0 0 1 0 0 0 0 0 0; % node 6
0 1 0 0 1 0 0 0 0 0 0; % node 7
0 1 0 0 1 0 0 0 0 0 0; % node 8
0 1 0 0 1 0 0 0 0 0 0; % node 9
0 0 0 0 1 0 0 0 0 0 0; % node 10
0 0 0 0 1 0 0 0 0 0 0; % node 11
];

num_node = size(adj_mat,1);
degree = sum(adj_mat,2);
deg_matrix = diag(degree);
deg_mat_inv = pinv(deg_matrix);
prob_mat = deg_mat_inv * adj_mat;
trans_prob_mat = transpose(prob_mat);
prod = df * trans_prob_mat;
I = eye(11);
r = inv(I - prod);
mat_1 = [1;1;1;1;1;1;1;1;1;1;1;];
mat_1 = (1-df) * (mat_1 / num_node);
pagerank_mi = r * mat_1;
disp("PageRank value using Matrix Inverse is :");
disp(pagerank_mi);
end

