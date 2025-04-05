<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class TraitementCommandeController extends AbstractController
{
    #[Route('/traitement/commande', name: 'app_traitement_commande')]
    public function traitem(): Response
    {
        return $this->render('traitement_commande/traitement_commande.html.twig', [
            'controller_name' => 'TraitementCommandeController',
        ]);
    }
}
