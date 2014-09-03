function test_intersections()

figure(1)
for j = 1:10
  r1 = rand()
  for k = 1:10
    r2 = rand()
    for i = 1:10
      v22 = rand() * r2 + r1
      clf
      hold on
      draw_circle([0;0], r1);
      draw_circle([0;-v22], r2);
      a = get_a(r1, r2, v22);
      c = get_c(r1, r2, v22);
      plot([0, c], [-a, -a], 'ro-')
      assert(abs(norm([c;-a]) - r1) < 1e-3);
      assert(abs(norm([c;-a] - [0;-v22]) - r2) < 1e-3);
      pause
    end
  end
end

end

function draw_circle(x, r)
  th = linspace(0, 2*pi);
  plot(x(1) + r*cos(th), x(2) + r*sin(th), 'k-');
end

function x = get_a(r1, r2, v22)
  x = r1 * (r2^2 - r1^2 - v22^2) / (-2 * r1 * v22);
end

function x = get_c(r1, r2, v22)
  x = sqrt(r1^2 - (r2^2 - r1^2 - v22^2)^2 / (4 * v22^2));
end
