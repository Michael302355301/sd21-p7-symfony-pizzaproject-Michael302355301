<?php

namespace App\Controller;

use App\Entity\Order;
use App\Factory\ContactFactory;
use App\Form\Type\ContactType;
use App\Repository\OrderRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class FormController extends AbstractController

    /**
     * @Route ("/contacts/create", name="createContact")
     */
    public function createContact(Request $request): Response
{
    $form = $this->createForm(Order::class);
    $form->handleRequest($request);

    if($form->isSubmitted() && $form->isValid()){
        $contact = ContactFactory::createFromForm($form);
        $this->contactRepository->save($contact);

        $this->addFlash('success', "User was successfully created!");

        return $this->redirectToRoute('contacts');
    }

    return $this->renderForm('form.html.twig', [
        'form' => $form,
    ]);
}