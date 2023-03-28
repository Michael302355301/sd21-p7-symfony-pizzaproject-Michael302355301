<?php

namespace App\Controller;
use App\Entity\Order;
use App\Entity\Product;
use App\Forms\ArticleFormType;
use App\Repository\OrderRepository;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Category;
use Doctrine\Persistence\ManagerRegistry;

class PizzaController extends AbstractController
{


    #[Route('/', name:'home')]
    public function home(EntityManagerInterface $entityManager): Response
    {
        $category = $entityManager->getRepository(Category::class)->findAll();

        if (!$category) {
            throw $this->createNotFoundException('No product found');
        }
        return $this->render('bezoeker/home.html.twig', ['categorys' => $category]);
    }

    #[Route('/category/{id}', name: 'cat_prod')]
    public function category(Category $category, ProductRepository $productRepository ): Response
    {
        $product = $productRepository->findBy(['category' => $category]);

        return $this->render('bezoeker/product.html.twig',
            ['products' => $product,
                'id' => $category]);
        }

    #[Route('contact')]
    public function contact(): Response
    {
        $contact = "";
        return $this->render('bezoeker/contact.html.twig',['contact'=>$contact]);
    }

    #[Route('login')]
    public function login(): Response
    {
        $login = "";
        return $this->render('bezoeker/login.html.twig',['login'=>$login]);
    }

    #[Route('/form/{id}', name:'formulier')]
    public function new(Request $request, OrderRepository $orderRepository, Product $pizza, EntityManagerInterface $em) : Response
    {
        $order = new Order();

        $order->setProduct($pizza);
        $pizzaName = $pizza->getName();
        $form = $this->createForm(ArticleFormType::class, $order);

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){
            $order = $form->getData();
            $em->persist($order);
            $em->flush();

            $this->addFlash('success', 'Bedankt voor uw besteling!');
//            return $this->redirectToRoute('home');
        }

        return $this->renderForm('bezoeker/new.html.twig', [
            'articleForm' => $form,
            'products' => $pizzaName
        ]);
    }

    public function edit(Order $article)
    {
        dd($article);
    }
}