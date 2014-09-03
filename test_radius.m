function test_radius()
figure(1);
clf
hold on

d1 = .09;
d2 = .19;
d3 = .16;

a = get_a(d1,d2,d3)
b = get_b(d1,d2,d3)
c = get_c(d1,d2,d3)

b^2 - 4*a*c

r2 = (-b + sqrt(b^2 - 4*a*c)) / (2*a)

r1 = d2
v22 = d1 + r2

draw_circle([0;0], r1);
draw_circle([0;-v22], r2);
x = get_nom_width(r1, r2, v22);
y = get_max_forward(r1, r2, v22);
plot([0, y], [-x, -x], 'ro-')
assert(abs(norm([y;-x]) - r1) < 1e-3);
assert(abs(norm([y;-x] - [0;-v22]) - r2) < 1e-3);


end

function a = get_a(d1, d2, d3)
  a = -4*d1^2 + 4*d2^2 -4*d3^2;
end

function b = get_b(d1, d2, d3)
  b = -4*d1^3 - 8*d1*d3^2 + 4*d1*d2^2;
end

function c = get_c(d1, d2, d3)
  c = -d1^4 - d2^4 - 4*d1^2*d3^2 + 2*d1^2*d2^2;
end

function draw_circle(x, r)
  th = linspace(0, 2*pi);
  plot(x(1) + r*cos(th), x(2) + r*sin(th), 'k-');
end

function x = get_nom_width(r1, r2, v22)
  x = r1 * (r2^2 - r1^2 - v22^2) / (-2 * r1 * v22);
end

function x = get_max_forward(r1, r2, v22)
  x = sqrt(r1^2 - (r2^2 - r1^2 - v22^2)^2 / (4 * v22^2));
end