<?php

namespace App\Factory;

use App\Entity\Order;
use Symfony\Component\Form\FormInterface;

class ContactFactory
{
    public static function createFromForm(FormInterface $form): Order
    {
        $contact = new Order();

        $contact->setName($form->get('Name')->getData());
        $contact->setLastname($form->get('lasttName')->getData());
        $contact->setPhonenumber($form->get('phoneNumber')->getData());
        $contact->setPostcode($form->get('postcode')->getData());
        $contact->setEmail($form->get('email')->getData());

        return $contact;
    }
}